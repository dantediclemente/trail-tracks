class TrailsController < ApplicationController
  before_filter :authenticate_user!
  def home
    trails = Trail.all
    my_trails = trails.where(user_id: current_user.id)
    hiked_trails = my_trails.where(hiked: true)
    trail_years = hiked_trails.sort_by { |trail| trail["date_hiked"] }
    years = []
    trail_years.each do |trail|
      split_date = trail.date_hiked.to_s.split("-")
      years << split_date[0]
    end
    distances = []
    trail_years.each do |trail|
      distances << trail.distance
    end
    @timeline = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Trail Timeline")
      f.options[:chart][:defaultSeriesType] = "line"
      f.xAxis(categories: years.map { |year| year.to_s.split("-")[0].to_i })
      f.series(:name=>'Distance (mi.)', :data=> distances)
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
