class API::V1::UsersController < APIController
  before_action :set_user, only: [:show, :update]
  #before_action :set_user, only: [:index, :create, :show, :update]

  def index
    @users = User.all
  end

  def show

  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created, location: api_v1_users_path(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  def update
    #byebug
    if @user.update(user_params)
      render :show, status: :ok, location: api_v1_users_path(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  #def set_user
  # @user = User.find(params[:user_id])
  #end

  def user_params
    params.fetch(:user, {}).
      permit(:id, :name, :email, :location, :bio, :role)
  end


end