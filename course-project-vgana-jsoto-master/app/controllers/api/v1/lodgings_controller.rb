class API::V1::LodgingsController < APIController
  before_action :set_lodging, only: [:show, :update]
  #before_action :set_user, only: [:index, :create, :show, :update]

  def index
    @lodgings = Lodging.all
  end

  def show

  end

  def create
    @lodging = Lodging.new(lodging_params)
    @user = User.find(lodging_params[:user_id])
    @lodging.user = @user
    if @lodging.save
      render :show, status: :created, location: api_v1_user_lodgings_path(@lodging)
    else
      render json: @lodging.errors, status: :unprocessable_entity
    end
  end


  def update
    #byebug
    if @lodging.update(lodging_params)
      render :show, status: :ok, location: api_v1_lodgings_path(@lodging)
    else
      render json: @lodging.errors, status: :unprocessable_entity
    end
  end

  private

  def set_lodging
    @lodging = Lodging.find(params[:id])
  end

  #def set_user
  # @user = User.find(params[:user_id])
  #end

  def lodging_params
    params.fetch(:lodging, {}).
      permit(:id, :title, :fee, :location, :policy, :description, :user_id)
  end

end
