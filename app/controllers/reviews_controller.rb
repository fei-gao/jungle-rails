class ReviewsController < ApplicationController
    before_filter :authorize

    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.new(review_params)
        @review.user_id = current_user.id
        if @review.save
            redirect_to :back
        else 
            redirect_to product_path(@product)
        end
    end
    
    def destroy
        @review = Review.find params[:id]
        
        if @review.destroy
          redirect_to :back, notice: 'Review deleted!'
        else 
          redirect_to :back
        end
      end

    private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
