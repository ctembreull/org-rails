json.array!(@teams) do |team|
  json.extract! team, :franchise_id, :abbr, :city, :name
  json.url team_url(team, format: :json)
end
