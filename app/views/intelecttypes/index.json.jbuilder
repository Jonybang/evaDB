json.array!(@intelecttypes) do |intelecttype|
  json.extract! intelecttype, :id, :name, :intelectprops_id
  json.url intelecttype_url(intelecttype, format: :json)
end
