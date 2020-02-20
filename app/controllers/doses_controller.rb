class DosesController < ApplicationController

  def new
    @doses = Dose.new
  end

  def create
     @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to dose_path(@cocktail)
    else
      render :new
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

  end

  private

  def dose_params
    params.require(:dose).permit(:cocktail, :ingredient)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

end

