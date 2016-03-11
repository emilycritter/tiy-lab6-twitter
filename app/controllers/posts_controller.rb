class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def post_params
    params.require(:post).permit(:post_text, :user_id, :photo_id, :password)
  end
end
