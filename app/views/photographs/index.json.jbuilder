json.array!(@photographs) do |photograph|
  json.extract! photograph, :id, :title, :date, :creator, :digital_publisher, :format
  json.url photograph_url(photograph, format: :json)
end
