json.array!(@projectdirections) do |projectdirection|
  json.extract! projectdirection, :id, :name, :projects_id
  json.url projectdirection_url(projectdirection, format: :json)
end
