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

  def update
    trail = Trail.find(params[:id])
    trail.update_attributes(hiked: true)
    render json: { id: params[:id] }.to_json, status: :ok
  end
end
