json.array!(@tags) do |tag|
  json.extract! tag, :id, :etiqueta
  json.url tag_url(tag, format: :json)
end
