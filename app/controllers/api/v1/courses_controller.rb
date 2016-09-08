module Api::V1
  class CoursesController < ApplicationController
    private

    def process_courses(courses)
      courses.map do |course|
        course.attributes.merge(skills: course.skills, state: course.state(current_user.id), teacher_name: course.teacher.name)
      end
    end
  end
end
