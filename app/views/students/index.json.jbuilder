json.array!(@students) do |student|
  json.extract! student, :id, :enter_year, :specialty_id, :faculty_id, :university_id
  json.url student_url(student, format: :json)
end
