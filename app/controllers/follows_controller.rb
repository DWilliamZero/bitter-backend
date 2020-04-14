class FollowsController < ApplicationController
  before_action :authorize_request
  
    # GET /follows
    def all
      @hates = Hate.all
      render json: @hates
    end

  # GET user/:user_id/followers
  def followers
    @followers = User.find(params[:user_id]).followers

    render json: @followers
  end

  # GET user/:user_id/following
  def following
    @followees = User.find(params[:user_id]).followees

    render json: @followees
  end

  # POST /follows
  def create
    @follow = Follow.new(follow_params)
    @follow.follower_id = @current_user.id

    if @follow.save
      render json: @follow#, status: :created, location: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /unfollow
  def destroy
    @follow = Follow.where(follower_id: @current_user.id, followee_id: follow_params[:followee_id])

    Follow.destroy(@follow[0].id)
    render json: "Another Relationship Succesfully Destroyed!"
  end

  private

    # Only allow a trusted parameters through.
    def follow_params
      params.require(:follow).permit(:followee_id)
    end
end