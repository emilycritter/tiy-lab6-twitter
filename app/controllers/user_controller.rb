class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(name: @user.name)
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :photo)
  end

  def timeline
    user_id = session[:user_id]
    if user_id.present?
      @current_user = User.find_by id: user_id
      # follower_ids = following_users.pluck(:id)
      # all_ids = follower_ids << user.id
      # @posts = Post.where(user_id: all_ids).order("created_at DESC")
      @posts = Post.all.order("created_at desc")
    else
      @posts = Post.all.order("created_at desc")
    end
  end

  def show
    @user = User.find_by(name: params[:name])

    user_id = session[:user_id]
    @current_user = User.find_by id: user_id if user_id.present?
  end

end
