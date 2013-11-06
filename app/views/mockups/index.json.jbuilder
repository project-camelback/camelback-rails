json.array!(@mockups) do |mockup|
  json.extract! mockup, 
  json.url mockup_url(mockup, format: :json)
end
