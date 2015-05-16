json.array!(@theses) do |thesis|
  json.extract! thesis, :id, :name, :scientist_id
  json.url thesis_url(thesis, format: :json)
end
