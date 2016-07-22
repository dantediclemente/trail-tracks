class Api::TrailsController < ApiController
  def show
    trail = Trail.find(params[:id])
    render json: { trail: trail }, status: :ok
  end
end
