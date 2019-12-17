class DosesController < ApplicationController
  before_action :set_cocktail

  def new
      # build : comme un new mais le cocktail ID est pré-remplis
      @dose = @cocktail.doses.build
  end
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(params["dose"]["ingredient"]) unless params["dose"]["ingredient"].blank?
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
     render :new
     # render 'cocktails/show' # to have verifications on the same page
    end
  end

  private
  def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def dose_params
      params.require(:dose).permit(:description)
  end
end