class PostsController < ApplicationController
  before_action do
    @current_user = User.find_by id: session[:user_id]
    if @current_user.blank?
      store_location
      redirect_to sign_in_path
    end
  end

  def index
    @posts = Post.all.order("created_at desc")
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(25)
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = @current_user
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def edit
    @post = Post.find_by id: params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]
    if @post.user.id == session[:user_id]
      if @post.update post_params
        redirect_to post_path(id: @post.id)
      else
        render :edit
      end
    else
      redirect_to post_path(id: @post.id)
    end
  end

  def delete
    @post = Post.find_by id: params[:id]
    @post.destroy
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:post_text, :photo, :password)
  end
end
