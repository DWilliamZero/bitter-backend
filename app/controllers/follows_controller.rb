class FollowsController < ApplicationController
  before_action :set_hate, only: [:show, :update, :destroy]
  #before_action :authorize_request, except: [:index, :show]

  # GET /follows
  def index
    @follows = Follow.all

    render json: @follows
  end

  # GET /follows/:id
  def show
    render json: @follow
  end

  # POST /follows
  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      render json: @follow, status: :created, location: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /follows/:id
  def update
    if @follow.update(follow_params)
      render json: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /follows/:id
  def destroy
    @follow.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def follow_params
      params.require(:follow).permit(:follow, :followee_id, :follower_id)
    end
end