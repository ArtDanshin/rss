class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :teacher_id
      t.datetime :run_at
      t.string :place
    end
  end
end
