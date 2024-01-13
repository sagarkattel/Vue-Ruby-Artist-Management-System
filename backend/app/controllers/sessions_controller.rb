class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id } 
      token = JwtToken.encode(payload) 
      time = Time.now + 24.hour.to_i
      render json: { token: token, message: "Logged In successfully" }, status: 201
    else
      render json: { message: "Invalid Email or password" }, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: "Logged Out" }, status: 201
  end
end
