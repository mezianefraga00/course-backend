class ApplicationController < ActionController::API
    include ActionController::Cookies
    
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
  
    
  
    def authorizepro
      @current_professor = Professor.find_by(id: session[:professor_id])
  
      render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_professor
    end
    
    def authorizestu
      @current_student = Student.find_by(id: session[:student_id])
  
      render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_student
    end
    
    private
    
    def render_unprocessable_entity_response(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
  
end
  