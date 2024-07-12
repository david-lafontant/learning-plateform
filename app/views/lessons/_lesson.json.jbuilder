json.extract! lesson, :id, :title, :content, :materials, :course_module_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
json.materials do
  json.array!(lesson.materials) do |material|
    json.id material.id
    json.url url_for(material)
  end
end
