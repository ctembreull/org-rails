json.array!(@franchises) do |franchise|
  json.extract! franchise, :abbr, :city, :name
  json.url franchise_url(franchise, format: :json)
end
