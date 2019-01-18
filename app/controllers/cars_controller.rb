class CarsController < ProtectedController
  before_action :set_car, only: [:show, :update, :destroy]

  # GET /cars
  def index
    @cars = current_user.cars

    render json: @cars
  end

  # GET /cars/1
  def show
    @cars = current_user.cars

    render json: @car
  end

  # POST /cars
  def create
    @car = current_user.car.new(car_params)

    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    @cars.update(car_params)
    if @car.update
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    @car = current_user.cars.find(params[:id])
    @car.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = current_user.car.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def car_params
      params.require(:car).permit(:year, :make, :model, :id)
    end
end
