class LodgingsController < ApplicationController
  before_action :set_lodging, only: %i[ show edit update destroy ]
  def index
    if @user != nil
      if params["format"].to_s == @user.id.to_s
        @lodgings = User.find_by(id:@user.id).lodgings
      else
        @lodgings = Lodging.all
      end
    else
      @lodgings = Lodging.all
    end
  end

  def show
  end

  def create
    @lodging = Lodging.new(lodging_params)
    @lodging.image.attach(lodging_params[:image])
    @lodging.video.attach(lodging_params[:video])

    respond_to do |format|
      @lodging.user_id = current_user.id
      if @lodging.save!
        format.html { redirect_to @lodging, notice: "Lodging was successfully created." }
        format.json { render :show, status: :created, location: @lodging }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @lodging = Lodging.new
  end

  def edit
  end

  # PATCH/PUT
  def update
    respond_to do |format|
      if @lodging.update(lodging_params)
        format.html { redirect_to @lodging, notice: "Lodging was successfully updated." }
        format.json { render :show, status: :ok, location: @lodging }
        #format.js { redirect_to @lodging }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lodging.destroy
    respond_to do |format|
      format.html { redirect_to lodgings_url, notice: "Lodging was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lodging
    @lodging = Lodging.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lodging_params
    params.require(:lodging).permit(:title, :user_id, :fee, :location,
       :policy, :description, :image , :video, :services)
  end
end
