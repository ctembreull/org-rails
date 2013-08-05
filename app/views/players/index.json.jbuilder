json.array!(@players) do |player|
  json.extract! player, :franchise_id, :team_id
  json.url player_url(player, format: :json)
end
