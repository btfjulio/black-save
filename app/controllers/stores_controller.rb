class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
    @offers = @store.offers
    @stores = Store.all

    render :template => "offers/index"
  end
end
