json.array!(@albumns) do |albumn|
  json.extract! albumn, :id
  json.url albumn_url(albumn, format: :json)
end
