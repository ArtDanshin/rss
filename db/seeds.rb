# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

USERS_COUNT = 10
COURSES_COUNT = 5

USER_SKILLS = 3
USER_WANTS = 4
COURSE_SKILLS = 2
COURSE_STUDENTS = 5

tags = [
  'Ruby', 'Rails', 'PostgreSQL', 'Angular', 'Oracle', 'Highload',
  'Neural networks', 'Machine learning', 'Big data', 'SQL', 'Git',
  'HTTP', 'Sinatra', 'C++', 'Python', 'RSpec', 'Testing', 'Vim'
]

USERS_COUNT.times do |n|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

tags.count.times do |n|
  Tag.create(skill: tags[n])
end

COURSES_COUNT.times do |n|
  Course.create(teacher: User.order("RANDOM()").first)
end

User.all.each do |user|
  USER_SKILLS.times do |n|
    Skill.create(user: user, tag: Tag.order("RANDOM()").first)
  end
end

User.all.each do |user|
  wants = Tag.all.sample(USER_WANTS)
  wants.count.times do |n|
    Want.create(user: user, tag: wants[n])
  end
end

Course.all.each do |course|
  skills = Tag.all.sample(COURSE_SKILLS)
  skills.count.times do |n|
    CourseSkill.create(course: course, tag: skills[n])
  end

  students = User.all.sample(COURSE_STUDENTS)
  students.count.times do |n|
    CourseStudent.create(course: course, user: students[n])
  end

  course.announce = Faker::Hacker.say_something_smart
  course.sphere = 'Web developing'
end
