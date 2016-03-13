class UserController < ApplicationController
  before_action except: [:timeline] do
    @current_user = User.find_by id: session[:user_id]
    if @current_user.blank?
      store_location
      redirect_to sign_in_path
    end
  end

  def new
    @user = User.new
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

  def edit
    @user = User.find_by(name: params[:name])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update user_params
      root_path
    else
      render :edit
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
  end

end
