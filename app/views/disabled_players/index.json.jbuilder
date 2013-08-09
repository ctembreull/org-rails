json.array!(@disabled_players) do |disabled_player|
  json.extract! disabled_player, :franchise_id, :player_id, :year, :length, :start_date, :end_date, :reason, :rehab
  json.url disabled_player_url(disabled_player, format: :json)
end
