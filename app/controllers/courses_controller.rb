class CoursesController < ApplicationController

        def index
          render json: Course.all
        end
      
        def create
          course = Course.create!(course_params)
          render json: course, status: :created
        end
        def destroy
          course = Course.find(params[:id])
          course.destroy

      
        end
        private
      
        def course_params
          params.permit(:name, :category, :description)
        end
      
      
end
