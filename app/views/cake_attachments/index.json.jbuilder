json.array!(@cake_attachments) do |cake_attachment|
  json.extract! cake_attachment, :id, :cake_id, :image
  json.url cake_attachment_url(cake_attachment, format: :json)
end
