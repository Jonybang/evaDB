json.array!(@event_documents) do |event_document|
  json.extract! event_document, :id, :name, :comments, :to_do, :url, :event_id
  json.url event_document_url(event_document, format: :json)
end
