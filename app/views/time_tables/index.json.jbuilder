json.array!(@time_tables) do |time_table|
  json.extract! time_table, :id
  json.url time_table_url(time_table, format: :json)
end
