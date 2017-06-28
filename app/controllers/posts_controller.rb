class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.rating = 0
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def upvote
    @post = Post.find(params[:post_id])
    current_rating = @post.upvote
    @post.update(rating: current_rating)
    redirect_to (request.env['HTTP_REFERER'])
  end

  def downvote
    @post = Post.find(params[:post_id])
    current_rating = @post.downvote
    @post.update(rating: current_rating)
    redirect_to (request.env['HTTP_REFERER'])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:artist_name, :content, :rating)
  end
end
