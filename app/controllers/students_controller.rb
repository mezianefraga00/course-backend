class StudentsController < ApplicationController
    skip_before_action :authorizestu,:authorizepro, only: :create

  def create
    student = Student.create!(user_params)
    session[:student_id] = student.id
    render json: student, status: :created
  end

  def show
    render json: @current_student
  end

  private

  def user_params
    params.permit(:name, :username, :password, :password_confirmation, :email)
  end
end
