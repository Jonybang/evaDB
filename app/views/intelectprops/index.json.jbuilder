json.array!(@intelectprops) do |intelectprop|
  json.extract! intelectprop, :id, :name, :indnumber, :description, :formula, :regdate, :enddate, :doclink, :intelecttype_id, :authors_id
  json.url intelectprop_url(intelectprop, format: :json)
end
