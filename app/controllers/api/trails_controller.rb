class Api::TrailsController < ApiController
  def index
    trails = Trail.all
    my_trails = trails.where(user_id: current_user.id)
    render json: { trails: my_trails }, status: :ok
  end

  def show
    trail = Trail.find(params[:id])
    render json: { trail: trail }, status: :ok
  end
end
