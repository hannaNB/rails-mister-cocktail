class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :show]

  def new
      # build : comme un new mais le cocktail ID est pré-remplis
      @review = @cocktail.reviews.build
  end
  def create
      @review = Review.new(review_params)
      @review.cocktail = @cocktail
      # raise
      if @review.save
        redirect_to cocktail_url(@cocktail), notice: 'cocktail was successfully destroyed.'
      else
       render :new
       # render 'cocktails/show' # to have verifications on the same page
      end
  end
  def destroy
    # NB : ip notice n'est pas coder sur le form
    @review = Review.find(params[:id])
    # raise
    if @review.destroy
        # redirect_to cocktails_url, notice: 'Review was successfully destroyed.'
        redirect_to cocktail_url(@review.cocktail), notice: 'Review was successfully destroyed.'
      else
       render :new
       # render 'cocktails/show' # to have verifications on the same page
    end
  end

  private
  def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def review_params
      params.require(:review).permit(:content, :stars, :cocktail_id)
  end

end