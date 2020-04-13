class HatesController < ApplicationController
  before_action :authorize_request

  # GET /hates
  def all
    @hates = Hate.all
    render json: @hates
  end


  # GET user/:user_id/posts/:post_id/hates
  def index
    @hates = Hate.where(user_id: @current_user.id, post_id: params[:post_id]).length
    render json: {hate_count: @hates}
  end

  # POST user/:user_id/posts/:post_id/hates
  def create
    @hate = Hate.new(user_id: @current_user.id, post_id: params[:post_id])

    #render json: @hate
    if @hate.save
      render json: @hate #, status: :created, location: @hate
    else
      render json: @hate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/posts/:post_id/hates
  def destroy
    @hate = Hate.where(user_id: @current_user.id, post_id: params[:post_id])

    if @hate[0] != nil
    Hate.destroy(@hate[0].id)
    render json: "Way to show the love... You dirty hippie!"
    else
      render json: "This hate does not exist"
    end
  end
  
end
