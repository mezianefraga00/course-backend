class ProfessorsController < ApplicationController
    skip_before_action :authorizepro, only: :create
    skip_before_action :authorizestu, only: :create
  
  def create
    professor = Professor.create!(user_params)
    session[:professor_id] = professor.id
    render json: professor, status: :created
  end

  def show
    render json: @current_professor
  end

  private

  def user_params
    params.permit(:name, :username, :password, :password_confirmation)
  end
end
