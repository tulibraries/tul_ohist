json.array!(@transcripts) do |transcript|
  json.extract! transcript, :id, :title, :date, :contact, :digital_publisher
  json.url transcript_url(transcript, format: :json)
end
