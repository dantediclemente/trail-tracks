class TrailsController < ApplicationController
  before_filter :authenticate_user!, except: [:home]

  def search
    trails = Trail.all
    my_trails = trails.where(user_id: current_user.id)
    @results = my_trails.where("name ILIKE ?", "%#{params[:q]}%")
    render :search
  end

  def home
    if user_signed_in?
      trails = Trail.all
      my_trails = trails.where(user_id: current_user.id)
      hiked_trails = my_trails.where(hiked: true)

    trails_by_year = hiked_trails.group_by { |key| key["date_hiked"].year }.values

    trail_distance_by_year = {}
    trails_by_year.each do |group|
      trail_sum = []
      group.each do |trail|
        trail_sum << trail.distance
        trail_distance_by_year[trail["date_hiked"].year] = trail_sum.sum
      end
    end

    @sorted = trail_distance_by_year.sort

    @timeline = LazyHighCharts::HighChart.new('graph', :style=>"height:92%") do |f|
      f.title(text: "Trail Timeline")
      f.options[:chart][:defaultSeriesType] = "line"
      f.xAxis(categories: @sorted.map { |year| year[0] })
      f.series(:name=>'Distance (mi.)', :data=> @sorted.map { |year| year[1] })
    end
    end
  end

  def index
    trails = Trail.all
    my_trails = trails.where(user_id: current_user.id)
    @hiked_trails = my_trails.where(hiked: true)
    @wish_trails = my_trails.where(hiked: false)
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
    @trail.user_id = current_user.id
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
