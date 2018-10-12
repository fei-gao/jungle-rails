class ReviewsController < ApplicationController
    def show
      @review = Review.find(params[:id])
    end
    
    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.new(review_params)
        @review.user_id = current_user.id
        if @review.save
            redirect_to review_path(@review)
        else 
            redirect_to product_path(@product)
        end
    end

    private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
