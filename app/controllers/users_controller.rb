class UsersController < ApplicationController
  def index
    # UserNotifierMailer.example(User.new(email: 'bo@samurails.com')).deliver
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserNotifierMailer.welcome_email(@user).deliver_now
      redirect_to root_url, notice: 'You signed up successfully'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.fetch(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
