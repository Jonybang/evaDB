json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :members_id, :sponsors_id, :experts_id, :documents_id
  json.url event_url(event, format: :json)
end
