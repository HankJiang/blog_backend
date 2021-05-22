class PostsController < ApplicationController
  before_action :load_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.search_by(search_params)
  end

  def show
    @post.viewed
  end

  def create
    @post = Post.create(create_params)
    render :show
  end

  def update
    @post.update(update_params)
    render :show
  end

  def destroy
    @post.destroy
    head :ok
  end

  private

  def load_post
    @post = Post.find(params.require(:id))
  end

  def search_params
    params.permit(:keywords)
  end

  def create_params
    params.permit(:title, :content, :is_publish, :publish_date).merge(user_id: current_user.id)
  end

  def update_params
    params.permit(:title, :content, :is_publish, :publish_date)
  end
end