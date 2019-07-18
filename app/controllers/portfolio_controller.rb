class PortfolioController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    basic_auth
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(posts_params)
    redirect_to portfolio_index_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    Post.create(posts_params)
    redirect_to portfolio_index_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to portfolio_index_path
  end

  def information
  end

  def profile
  end

  private

  def posts_params
    params.permit(:apptitle, :image, :github, :text).merge(user_id: current_user.id)
  end

  def basic_auth
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USERNAME"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end
  end

end
