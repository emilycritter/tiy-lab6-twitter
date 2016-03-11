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
    user_id = session[:user_id]
    if user_id.present?
      @current_user = User.find_by id: user_id
    end
    if user_id.present?
      @posts = Post.all.order("created_at desc")
    else
      follower_ids = following_users.pluck(:id)
      all_ids = follower_ids << user.id
      @posts = Post.where(user_id: all_ids).order("created_at DESC")
    end
  end
end
