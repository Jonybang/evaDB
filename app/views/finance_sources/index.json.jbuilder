json.array!(@finance_sources) do |finance_source|
  json.extract! finance_source, :id, :name, :contact_data_id, :link_id, :volume_from, :volume_to, :currency_id, :projects_id, :project_directions_id, :finance_programs_id
  json.url finance_source_url(finance_source, format: :json)
end
