json.array!(@your_flicks) do |your_flick|
  json.extract! your_flick, 
  json.url your_flick_url(your_flick, format: :json)
end
