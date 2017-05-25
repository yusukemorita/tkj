namespace :places do
  desc '住所がないレコードに住所を登録する'
  task reverse_geocode: :environment do
    p 'start'
    no_address_places = Place.where(address: '' )
    num = no_address_places.size
    no_address_places.each_with_index do |place, i|
      geo_localization = "#{place.latitude},#{place.longitude}"
      query = Geocoder.search(geo_localization, params: {language: :ja}).first
      new_address = query.try(:address)
      place.update_attribute :address, new_address
      p "#{place.id}, address: #{new_address}"
    end
    p 'finished reverse_geocode task'
  end
end
