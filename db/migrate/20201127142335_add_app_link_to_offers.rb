class AddAppLinkToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :app_link, :string
  end
end
