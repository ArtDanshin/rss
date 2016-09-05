class Course < ActiveRecord::Base
  STATES = {
    none:     0,
    pending:  1,
    approved: 2
  }

  belongs_to :teacher, foreign_key: :teacher_id, class_name: User

  has_many :course_skills
  has_many :tags, through: :course_skills

  has_many :course_students
  has_many :students, through: :course_students, source: :user

  scope :actual, -> { where("run_at IS NULL OR DATE_PART('days', run_at) >= DATE_PART('days', NOW())") }

  def skills
    tags.pluck(:skill)
  end

  def state(user_id)
    if student?(user_id) && approved?
      STATES[:approved]
    elsif student?(user_id)
      STATES[:pending]
    else
      STATES[:none]
    end
  end

  private

  def student?(user_id)
    user_id.in?(students.pluck(:id))
  end

  def approved?
    !(run_at.blank? || place.blank?)
  end
end
