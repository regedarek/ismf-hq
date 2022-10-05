json.extract! question, :id, :answer_type, :name, :position, :question_source_type, :question_source_value, :created_at, :updated_at
json.url question_url(question, format: :json)
