json.array!(@papers) do |paper|
  json.extract! paper, :id, :name, :scientist_id
  json.url paper_url(paper, format: :json)
end
