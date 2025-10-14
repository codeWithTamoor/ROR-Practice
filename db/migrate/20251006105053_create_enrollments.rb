class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments, id: false do |t|
      t.integer :student_id, null: false
      t.integer :course_id, null: false
      t.string :grade

      t.timestamps
    end
  end
end
