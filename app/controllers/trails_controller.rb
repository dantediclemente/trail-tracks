class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
    @trail = Trail.new
    @rating_collection = Trail::RATING
  end

  def create
    @trail = Trail.new(trail_params)
    @rating_collection = Trail::RATING

    if @trail.save
      flash[:notice] = "Trail added successfully"
      redirect_to trail_path(@trail)
    else
      flash[:errors] = @trail.errors.full_messages.join(",")
      @rating_collection = Trail::RATING
      render :new
    end
  end

  def edit
    @trail = Trail.find(params[:id])
    @rating_collection = Trail::RATING
  end

  def update
    @trail = Trail.find(params[:id])
    @rating_collection = Trail::RATING

    if @trail.update_attributes(trail_params)
      flash[:notice] = "Trail updated successfully"
      redirect_to trail_path(@trail)
    else
      flash[:errors] = @trail.errors.full_messages.join(",")
      @rating_collection = Trail::RATING
      render :edit
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    @trail.destroy
    flash[:notice] = "Trail deleted successfully"
    redirect_to trails_path
  end

  private

  def trail_params
    params.require(:trail).permit(
    :name,
    :park_name,
    :lat,
    :lng,
    :distance,
    :date_hiked,
    :rating,
    :hiked,
    :duration,
    :description
    )
  end
end
