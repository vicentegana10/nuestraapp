class StaysController < ApplicationController
  before_action :set_stay, only: %i[ show edit update destroy ]
  def index
    @stays = User.find_by(id:@user.id).stays
  end

  def show
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def set_stay
    @stay = Stay.find(params[:id])
  end
end
