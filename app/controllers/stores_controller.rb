class StoresController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @store = Store.find(params[:id])
    @offers = @store.offers.order(created_at: :desc)
    @stores = Store.all

    render :template => "offers/index"
  end
end
