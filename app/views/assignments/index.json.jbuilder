json.array!(@assignments) do |assignment|
  json.extract! assignment, :title, :url
  json.url assignment_url(assignment, format: :json)
end
