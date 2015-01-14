json.array!(@links) do |link|
  json.extract! link, :id, :name, :base_link
  json.url link_url(link, format: :json)
end
