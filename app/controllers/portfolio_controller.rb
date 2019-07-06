class PortfolioController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    http_basic_authenticate_with :name => ENV['BASIC_AUTH_USERNAME'], :password => ENV['BASIC_AUTH_PASSWORD'] if Rails.env == "production"
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

  private

  def posts_params
    params.permit(:apptitle, :image, :github, :text).merge(user_id: current_user.id)
  end

end
