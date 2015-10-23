class RegionsController < ApplicationController

  def show
    @region = Region.find(params[:id])
  end

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      redirect_to @region
    else
      render 'new'
    end
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update_attributes(region_params)
      flash[:success] = "Region updated"
      redirect_to @region
    else
      render 'edit'
    end
  end

  def destroy
    @region = Region.find(params[:id]).destroy
    redirect_to regions_path
  end

  private

  def region_params
    params.require(:region).permit(:name, :country_id)
  end

end
