class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to user_path
  #   else
  #     render 'new'
  #   end
  # end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(user_params)
  #     redirect_to user_path
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil if session[:user_id] == @user.id
    @user.destroy
    redirect_to root_path
  end

  private

  # def user_params
  #   params.require(:user).permit(:provider, :uid, :name, :location, :image, :description)
  # end

end