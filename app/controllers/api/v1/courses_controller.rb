module Api::V1
  class CoursesController < ApplicationController
    # TODO: Change to current_user
    FAKE_USER_ID = 1

    private

    def process_courses(courses)
      courses.map do |course|
        course.attributes.merge(skills: course.skills, state: course.state(FAKE_USER_ID), teacher_name: course.teacher.name)
      end
    end
  end
end
