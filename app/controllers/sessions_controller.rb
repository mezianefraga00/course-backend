class SessionsController < ApplicationController
    skip_before_action :authorizestu,:authorizepro, only: :createprofessor, only: :createstudent
  
    def createprofessor
      professor = Professor.find_by(professorname: params[:username])
      if professor&.authenticate(params[:password])
        session[:professor_id] = professor.id
        render json: professor
      else
        render json: { errors: ["Invalid username or password"] }, status: :unauthorized
      end
    end
    def createstudent
        student = Student.find_by(username: params[:username])
        if student&.authenticate(params[:password])
          session[:student_id] = student.id
          render json: student
        else
          render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
      end
  
    def destroyprofessor
      session.delete :professor_id
      head :no_content
    end
    def destroystudent
        session.delete :student_id
        head :no_content
      end
  
  end
  