class User < ActiveRecord::Base
  has_many :skills
  has_many :tags, through: :skills

  has_many :wants
  has_many :tags, through: :wants

  has_many :courses, foreign_key: :teacher_id

  def name
    [first_name, last_name].join(' ')
  end

  def self.authenticate(login, pass)
    LdapAuthenticate::authenticate(login, pass)
  end
end
