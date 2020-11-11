class SeedsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_seed, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
    unless @seed.user.id == current_user.id
    redirect_to root_path
    end
  end

  def update
    if @seed.update(seed_params)
      redirect_to seed_path
    else
      render :edit
    end
  end

  def destroy
    unless @seed.user.id == current_user.id
      redirect_to root_path
    end
    if @seed.destroy
      redirect_to root_path
    end
  end

  def search
    redirect_to root_path if params[:keyword] == ""

    split_keyword = params[:keyword].split(/[[:blank:]]+/)

    @seeds = []
    split_keyword.each do |keyword|
      next if keyword == ""
      @seeds += Seed.where('title LIKE(?)', "%#{keyword}%")
    end
    @seeds.uniq!

  end

  private

  def seed_params
    params.require(:seed).permit(:title, :image, :tag_id, :idea).merge(user_id: current_user.id)
  end

  def set_seed
    @seed = Seed.find(params[:id])
  end

end
