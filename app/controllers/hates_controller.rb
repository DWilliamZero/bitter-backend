class HatesController < ApplicationController
  before_action :set_hate, only: [:show, :update, :destroy]
  before_action :authorize_request, except: [:index, :show]

  # GET /hates
  def index
    @hates = Hate.all

    render json: @hates
  end

  # GET /hates/1
  def show
    render json: @hate
  end

  # POST /hates
  def create
    @hate = Hate.new(hate_params)

    if @hate.save
      render json: @hate, status: :created, location: @hate
    else
      render json: @hate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hates/1
  def update
    if @hate.update(hate_params)
      render json: @hate
    else
      render json: @hate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hates/1
  def destroy
    @hate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hate
      @hate = Hate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hate_params
      params.require(:hate).permit(:hate, :user_id, :post_id)
    end
end
