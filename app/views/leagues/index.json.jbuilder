json.array!(@leagues) do |league|
  json.extract! league, :abbr, :name, :level
  json.url league_url(league, format: :json)
end
