class OffersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_offers_and_stores
  before_action :set_offer, only: %i(show)

  def index 
  end

  def show
    return unless @offer.hide
    redirect_to offers_path
  end
  
  private
  
  def set_offer 
    @offer = Offer.find(params[:id])
  end

  def set_offers_and_stores
    @offers = Offer.posted
    @stores = Store.all
  end
end
