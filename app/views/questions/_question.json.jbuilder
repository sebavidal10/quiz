json.extract! question, :id, :content, :position, :exam_id, :created_at, :updated_at
json.url question_url(question, format: :json)
