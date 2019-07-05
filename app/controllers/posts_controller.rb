class PostsController < ApplicationController
  expose_decorated :posts, :fetch_posts
  expose_decorated :post

  skip_verify_authorized only: %i[index show]

  def index
  end

  def show
  end

  private

  def fetch_posts
    Post
      .published
      .includes(:user, :taggings)
      .order(created_at: :desc)
      .page(params[:page])
  end
end
