json.extract! appointment, :id, :start_time, :tutor_id, :student1, :student2, :student3, :student4, :student5, :faculty, :professor_id, :number_students, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
