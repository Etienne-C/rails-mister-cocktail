class DosesController < ApplicationController
  before_action :set_cocktail

  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)

    if @dose.save
      redirect_to @cocktail, notice: 'Dose was successfully added'
    else
      render "new"
    end
  end

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to doses_url, notice: 'Dose was successfully destroyed.' }
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
