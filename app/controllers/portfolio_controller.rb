class PortfolioController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(posts_params)
  end

  def create
    Post.create(posts_params)
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to portfolio_index_path
  end

  private
  def posts_params
    params.permit(:apptitle, :image, :github, :text)
  end

end
