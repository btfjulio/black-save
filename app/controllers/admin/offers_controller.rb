module Admin
  class OffersController < ApplicationController
    before_action :set_offer, only: %i(edit update destroy)

    def index 
      @offers = Offer.all
    end

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
      if @offer.update(offer_params) 
        redirect_to @offer
      else
        flash.now[:notice] = @offer.errors.full_messages.to_sentence
        render :new
      end
    end

    def destroy 
      @offer.destroy
      redirect_to offers_path
    end

    private 

    def offer_params 
      params.require(:offer).permit(:title, :body, :link, :coupon, :price, :photo)
    end

    def set_offer 
      @offer = Offer.find(params[:id])
    end
  end
end
