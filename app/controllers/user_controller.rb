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
      if @current_user && @current_user.following_users.present?
        follower_ids = @current_user.following_users.pluck(:id)
        all_ids = follower_ids << @current_user.id
        @posts = Post.where(user_id: all_ids).order("created_at DESC")
      else
        @posts = Post.all.order("created_at desc")
      end
    else
      @posts = Post.all.order("created_at desc")
    end
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(25)
  end

  def show
    @user = User.find_by(name: params[:name])

    user_id = session[:user_id]
    @current_user = User.find_by id: user_id if user_id.present?
  end

  def edit_photo
    @user = User.find_by(id: params[:id])
  end

  def update_photo
    @user = User.find_by(id: params[:id])
    if @user.update user_params
      redirect_to user_path(name: @user.name)
    else
      render :edit_photo
    end
  end

  def follow
    @user = User.find_by(name: params[:name])

    user_id = session[:user_id]
    if user_id.present?
      @current_user = User.find_by id: user_id
      @current_user.follow(@user)
    end
    redirect_to user_path(name: @user.name)
  end

  def unfollow
    @user = User.find_by(name: params[:name])

    user_id = session[:user_id]
    if user_id.present?
      @current_user = User.find_by id: user_id
      @current_user.stop_following(@user)
    end
    redirect_to user_path(name: @user.name)
  end

  def block
    @user = User.find_by(name: params[:name])

    user_id = session[:user_id]
    if user_id.present?
      @current_user = User.find_by id: user_id
      @current_user.block(@user)
    end
    redirect_to user_path(name: @user.name)
  end

  def unblock
    @user = User.find_by(name: params[:name])

    user_id = session[:user_id]
    if user_id.present?
      @current_user = User.find_by id: user_id
      @current_user.unblock(@user)
    end
    redirect_to user_path(name: @user.name)
  end

end
