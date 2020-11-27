class OffersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_offers_and_stores
  
  def index 
  end

  def show
    @offer = Offer.find(params[:id])
  end

  private

  def set_offers_and_stores
    @offers = Offer.all.order(created_at: :desc)
    @stores = Store.all
  end
end
