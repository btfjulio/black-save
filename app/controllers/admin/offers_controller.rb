module Admin
  class OffersController < ApplicationController
    def new 
      @offer = Offer.new
    end

    def create 
      @offer = Offer.new(offer_params)
      if @offer.save 
        redirect_to @offer
      else
        flash.now[:notice] = @offer.errors.full_messages.to_sentence
        render :new
      end
    end 

    def edit 
      
    end

    def update 
    end

    def destroy 
    end

    private 

    def offer_params 
      params.require(:offer).permit(:title, :body, :link, :coupon, :price)
    end

    def set_offer 
      @offer = Offer.find(params[:id])
    end
  end
end
