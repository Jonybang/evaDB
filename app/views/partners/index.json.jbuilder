json.array!(@partners) do |partner|
  json.extract! partner, :id, :name, :contact_data_id, :socnet_links_id, :organization_id, :skills_id, :workpost_id, :industries_id, :equips_id, :intellect_properties_id, :team_projects_id, :chief_projects_id, :expert_projects_id, :project_tasks_id, :terms, :sponsor_events_id, :expert_events_id
  json.url partner_url(partner, format: :json)
end
