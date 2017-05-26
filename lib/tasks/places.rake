namespace :places do

  desc '住所がないレコードに住所を登録する'
  task reverse_geocode: :environment do
    no_address_places = Place.where(address: '' )
    no_address_places.each_with_index do |place, i|
      geo_localization = "#{place.latitude},#{place.longitude}"
      query = Geocoder.search(geo_localization, params: {language: :ja}).first
      new_address = query.try(:address)
      place.update_attribute :address, new_address
      p "#{place.id}, address: #{new_address}"
    end
    p 'finished reverse_geocode task'
  end

  desc '都道府県を登録'
  task add_prefecture: :environment do
    no_prefecture_places = Place.where(prefecture: nil)
    no_prefecture_places.each_with_index do |place, i|
      geo_localization = "#{place.latitude},#{place.longitude}"
      begin
        query = Geocoder.search(geo_localization, params: {language: :ja}).first
        address_components =  query.try(:address_components)
        address_components.each do |item|
          if item["types"][0] == "administrative_area_level_1"
            p "id: #{place.id} #{item["long_name"]}"
            place.update_attribute :prefecture, item["long_name"]
          end
        end
      rescue => e
        p "id: #{place.id} error"
      end
    end
    p '都道府県登録完了'
  end

end
