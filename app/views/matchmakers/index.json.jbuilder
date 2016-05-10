json.array!(@matchmakers) do |matchmaker|
  json.extract! matchmaker, :id, :uid, :address, :latitude, :longitude
  json.url matchmaker_url(matchmaker, format: :json)
end
