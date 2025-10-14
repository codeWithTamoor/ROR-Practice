# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data (optional, only for dev/testing)

# Create Students
students = Student.create!([
  { name: "Alice Johnson" },
  { name: "Bob Smith"},
  { name: "Charlie Brown"}
])

# Create Courses
courses = Course.create!([
  { title: "Ruby on Rails Basics"},
  { title: "Advanced JavaScript"},
  { title: "Database Design" }
])

# Create Enrollments (join between students and courses)
Enrollment.create!([
  { student_id: students[0].id, course_id: courses[0].id, grade: "A" },
  { student_id: students[0].id, course_id: courses[2].id, grade: "B+" },
  { student_id: students[1].id, course_id: courses[1].id, grade: "A-" },
  { student_id: students[2].id, course_id: courses[0].id, grade: "B" }
])

puts "Seed data created successfully!"
puts "Students: #{Student.count}, Courses: #{Course.count}, Enrollments: #{Enrollment.count}"

