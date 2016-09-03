class CreateCourseStudents < ActiveRecord::Migration
  def change
    create_table :course_students, id: false do |t|
      t.integer :course_id
      t.integer :user_id
    end
  end
end
