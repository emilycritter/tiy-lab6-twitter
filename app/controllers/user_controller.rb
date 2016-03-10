class UserController < ApplicationController
  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_back_or_default root_path
    else
      render :new
    end
  end

  def timeline
    # follower_ids = following_users.pluck(:id)
    # all_ids = follower_ids << user.id
    # Post.where(user_id: all_ids).order("created_at DESC")
  end
end
