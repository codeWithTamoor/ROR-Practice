class Enrollment < ApplicationRecord
  #self.primary_keys = :student_id, :course_id  # cOmposite keey declaration

  belongs_to :student
  belongs_to :course

  validates :student_id, uniqueness: { scope: :course_id }

  def to_param
    "#{student_id}-#{course_id}"
  end
end
