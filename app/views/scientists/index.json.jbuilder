json.array!(@scientists) do |scientist|
  json.extract! scientist, :id, :degree_id, :rank_id, :papers_id, :degree
  json.url scientist_url(scientist, format: :json)
end
