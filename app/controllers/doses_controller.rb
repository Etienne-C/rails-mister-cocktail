class DosesController < ApplicationController

  def index
    @doses = Dose.all
  end

  def new
    @doses = Dose.new
  end

  def create
     @dose = Dose.new(dose_params)

    respond_to do |format|
      if @dose.save
        format.html { redirect_to @dose, notice: 'Dose was successfully added' }
        format.json { render :show, status: :created, location: @dose }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
