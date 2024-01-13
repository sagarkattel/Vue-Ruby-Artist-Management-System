# app/controllers/user_controller.rb
class UserController < ApplicationController
  # before_action :authenticate_user, only: [:index, :edit, :update, :destroy]
  def new
    @user = User.new
    render json:@user
  end

  def index
    @user=User.all
    render json: @user,status: 200
  end
  

  def create
      puts "Params: #{params.inspect}" # Add this line to log parameters
    @user = User.new(user_params)
    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      render json:"Updated Successfully", status: 200
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destroy
      render json:"Deleted Successsfully", status: 200
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :dob, :phone, :gender, :address)
  end
  
  
  
  
  

end
