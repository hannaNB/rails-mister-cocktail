class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :show]
  # before_action :set_dose
  # before_action :set_ingredient
  # before_action :set_dose, only: [:destroy]

  def new
      # build : comme un new mais le cocktail ID est pré-remplis
      @dose = @cocktail.doses.build
  end
  def create
    @dose = Dose.new(dose_params)
    # raise
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(params["dose"]["ingredient"]) unless params["dose"]["ingredient"].blank?
    if @dose.save
      redirect_to cocktail_url(@cocktail), notice: 'cocktail was successfully destroyed.'
    else
     render :new
     # render 'cocktails/show' # to have verifications on the same page
    end
  end

  def destroy
    # @dose = Ingredient.find(params[:ingredient_id])
    # @dose.cocktail = @cocktail
    # @dose.ingredient = Ingredient.find(params["dose"]["ingredient"])
    @dose = Dose.find(params[:id])
    # @dose.destroy
    if @dose.destroy
      redirect_to cocktail_url(@dose.cocktail), notice: 'Ingredient was successfully destroyed.'
    else
     render :new
     # render 'cocktails/show' # to have verifications on the same page
    end
  end

  private
  def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
  end
  # si on autorise par 'ingredient_id' dans les strong params
  # alors impossible de supprimer car il ne peut pas récuperer 
  # l'ingredient_id !!!!!!!!!!
  def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
  end
end