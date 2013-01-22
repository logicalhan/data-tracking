json.array!(@event_data) do |event_datum|
  json.extract! event_datum, :tracked_at, :event_id
  json.url event_datum_url(event_datum, format: :json)
end