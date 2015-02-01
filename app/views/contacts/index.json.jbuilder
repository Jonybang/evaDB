json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :contact_data_id, :socnet_links_id, :organization_id, :skills_id, :workpost_id, :industries_id, :equips_id, :intellect_properties_id, :team_projects_id, :chief_projects_id, :expert_projects_id, :member_events_id, :project_tasks_id
  json.url contact_url(contact, format: :json)
end
