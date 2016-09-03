class CreateCourseSkills < ActiveRecord::Migration
  def change
    create_table :course_skills, id: false do |t|
      t.integer :course_id
      t.integer :tag_id
    end
  end
end
