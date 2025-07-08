json.extract! summary, :id, :title, :original_text, :summary, :user_id, :created_at, :updated_at
json.url summary_url(summary, format: :json)
