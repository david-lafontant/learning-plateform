json.extract! course, :id, :name, :code, :description, :credit, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
