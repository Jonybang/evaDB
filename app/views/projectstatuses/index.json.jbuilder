json.array!(@projectstatuses) do |projectstatus|
  json.extract! projectstatus, :id, :name, :projects_id
  json.url projectstatus_url(projectstatus, format: :json)
end
