json.array!(@ranks) do |rank|
  json.extract! rank, :id, :name, :scientists_id
  json.url rank_url(rank, format: :json)
end
