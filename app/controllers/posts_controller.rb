class PostsController < ApplicationController
  before_action :authorize_request

  # GET posts/
  # GET user/:user_id/posts
  def index
    @posts = Post.all

    render json: @posts, include: :user
  end

  # GET user/:user_id/posts/:id
  def show
    @post = Post.where(id: params[:id], user_id: @current_user.id)
    if @post != []
    render json: @post
    else
      render json: "Post does not exist."
    end
  end

  # POST user/:user_id/posts
  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id

     if @post.save
      render json: "Post Was Created!"
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT user/:user_id/posts/:id
  def update
    @post = Post.where(id: params[:id], user_id: @current_user.id)
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE user/:user_id/posts/:id
  def destroy
    @post = Post.where(id: params[:id], user_id: @current_user.id)
    Post.destroy(@post[0].id)
    render json: "Post deleted"
  end

  private

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:image_url, :content)
    end
end