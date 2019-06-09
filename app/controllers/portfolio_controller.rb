class PortfolioController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    
  end

  def create
    Post.create(posts_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private
  def posts_params
    params.permit(:apptitle, :image, :github, :text)
  end

end
