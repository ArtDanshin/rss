module Api::V1
  class NearestCoursesController < Api::V1::CoursesController

    def index
      @courses = process_courses(Course.nearest)
    end
    
  end
end
