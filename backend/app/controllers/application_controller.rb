class ApplicationController < ActionController::Base

# include JwtToken
include ::JwtToken

private

def authenticate_user
  header = request.headers['Authorization']

  if header.present?
    token = header.split(' ').last
    begin
      @decoded = JwtToken.decode(token)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  else
    render json: { errors: 'Authorization header missing' }, status: :unauthorized
  end
end



  # def current_user
  #   if session[:user_id]
  #     user = User.find_by(id: session[:user_id])
  #     @current_user = user if user.is_a?(User)
  #   end

  #   @current_user
  # end
  # helper_method :current_user

  # private

  # def require_login
  #   unless current_user.present?
  #     flash[:alert] = "You must be logged in to access this page."
  #     redirect_to login_path # Adjust the redirect path as needed
  #   end
  # end


end
