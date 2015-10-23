class TurbazasController < ApplicationController

  def show
    @turbaza = Turbaza.find(params[:id])
  end

  def index
    @turbazas = Turbaza.paginate(:page => params[:page], :per_page => 10)
    @countries = Country.all
  end

  def new
    @turbaza = Turbaza.new
  end

  def create
    @turbaza = Turbaza.new(turbaza_params)
    if @turbaza.save
      redirect_to @turbaza
    else
      render 'new'
    end
  end

  def edit
    @turbaza = Turbaza.find(params[:id])
  end

  def update
    @turbaza = Turbaza.find(params[:id])
    if @turbaza.update_attributes(turbaza_params)
      flash[:success] = "Turbaza updated"
      redirect_to @turbaza
    else
      render 'edit'
    end
  end

  def destroy
    @turbaza = Turbaza.find(params[:id]).destroy
    redirect_to turbazas_path
  end

  private

  def turbaza_params
    params.require(:turbaza).permit(:name, :city_id)
  end

end
