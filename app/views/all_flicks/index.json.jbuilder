json.array!(@all_flicks) do |all_flick|
  json.extract! all_flick, 
  json.url all_flick_url(all_flick, format: :json)
end
