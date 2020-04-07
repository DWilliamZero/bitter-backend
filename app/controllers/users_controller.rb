class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authorize_request, except: :create

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/:id
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    @token = encode({user_id: @user.id, username: @user.username});
    if @user.save
      render json: {user: @user, token: @token}, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @current_user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @current_user.destroy
    render json: "User Was Deleted: #{@current_user}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :image_url, :blurb)
    end
end
