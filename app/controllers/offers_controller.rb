class OffersController < ApplicationController
  skip_before_action :authenticate_user!
  def index 
    @offers = Offer.all.order(created_at: :desc)
    @stores = Store.all
  end

  def show
    @offer = Offer.find(params[:id])
  end
end
