json.array!(@finance_programs) do |finance_program|
  json.extract! finance_program, :id, :name, :terms, :finance_source_id
  json.url finance_program_url(finance_program, format: :json)
end
