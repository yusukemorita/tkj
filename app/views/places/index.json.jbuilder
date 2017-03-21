json.array!(@places) do |place|
  json.extract! place, :id, :title, :district, :content
  json.url place_url(place, format: :json)
end
