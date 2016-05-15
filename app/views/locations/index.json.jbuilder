json.array!(@locations) do |location|
  json.extract! location, :id, :title, :street, :city, :state, :zip
  json.url location_url(location, format: :json)
end
