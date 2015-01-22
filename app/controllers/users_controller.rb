class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:index, :edit, :update]


  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.reputation = 0
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_url
    else
      render 'new'
    end
  end


  private

    def user_params
      params.require(:user).permit(:username,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end



end
