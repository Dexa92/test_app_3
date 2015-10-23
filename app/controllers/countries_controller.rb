class CountriesController < ApplicationController

  def show
    @country = Country.find(params[:id])
  end

  def index
    @countries = Country.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to @country
    else
      render 'new'
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update_attributes(country_params)
      flash[:success] = "Country updated"
      redirect_to @country
    else
      render 'edit'
    end
  end

  def destroy
    @country = Country.find(params[:id]).destroy
    redirect_to countries_path
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end
