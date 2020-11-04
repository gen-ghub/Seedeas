class SeedsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  def index
    @seeds = Seed.order("created_at DESC")
  end

  def new
    @seed = Seed.new
  end

  def create
    @seed = Seed.new(seed_params)
    if @seed.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def seed_params
    params.require(:seed).permit(:title, :image, :tag_id, :idea).merge(user_id: current_user.id)
  end

end
