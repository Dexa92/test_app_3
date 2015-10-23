class CitiesController < ApplicationController

  def show
    @city = City.find(params[:id])
  end

  def index
    @cities = City.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to @city
    else
      render 'new'
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update_attributes(city_params)
      flash[:success] = "City updated"
      redirect_to @city
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:id]).destroy
    redirect_to cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :region_id)
  end

end
