json.array!(@stats) do |stat|
  json.extract! stat, :player_id, :team_id, :stat_definition_id, :season, :stint, :value
  json.url stat_url(stat, format: :json)
end
