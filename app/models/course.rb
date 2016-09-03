class Course < ActiveRecord::Base
  belongs_to :teacher, foreign_key: :teacher_id, class_name: User

  has_many :course_skills
  has_many :tags, through: :course_skills

  has_many :course_students
  has_many :students, through: :course_students, source: :user
end
