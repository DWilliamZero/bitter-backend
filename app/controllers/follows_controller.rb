class FollowsController < ApplicationController
  before_action :authorize_request
  
  # GET /followers
  def followers
    @followers = @current_user.followers

    render json: @followers
  end

  # GET /following
  def following
    @followees = @current_user.followees

    render json: @followees
  end

  # POST /follow
  def create
    @follow = Follow.new(follow_params)
    @follow.follower_id = @current_user.id

    if @follow.save
      render json: @follow, status: :created, location: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /un-follow
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