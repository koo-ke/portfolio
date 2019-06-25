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

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def posts_params
    params.permit(:apptitle, :image, :github, :text)
  end

end
