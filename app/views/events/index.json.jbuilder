json.array!(@events) do |event|
  json.extract! event, :event_type, :event_date
  json.url event_url(event, format: :json)
end