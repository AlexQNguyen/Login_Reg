class UsersController < ApplicationController
  before_action :check_session
  def index
  end

  def show
    @users = User.find(params[:id])
  end

  def new
  end

  def update
      @users = User.find(params[:id])
  end

  # def edit
  #   @users = User.find(params[:id])
  #   if @users.update(users_params)
  #     redirect_to "/users/#{@users.id}/show"
  #   else
  #     render json: users.errors
  #   end
  # end
  # def delete
  #   User.find(params[:id]).destroy
  #   redirect_to '/', notice:"You have Deleted a Dojo!"
  # end

  private
  def check_session
    if !session[:user_id]
      redirect_to '/'
    end
  end
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
