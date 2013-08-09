json.array!(@unavailable_players) do |unavailable_player|
  json.extract! unavailable_player, :franchise_id, :player_id, :year, :length, :start_date, :end_date, :reason
  json.url unavailable_player_url(unavailable_player, format: :json)
end
