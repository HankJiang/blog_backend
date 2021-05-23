class PostsController < ApplicationController
  before_action :load_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.search_by(search_params)
  end

  def show
    @post.viewed
  end

  def create
    @post = Post.new(create_params)
    if @post.save
      render :show
    else
      render json: @post.errors, status: :bad_request
    end
  end

  def update
    @post.assign_attributes(update_params)
    if @post.save
      render :show
    else
      render json: @post.errors, status: :bad_request
    end
  end

  # TODO check author
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