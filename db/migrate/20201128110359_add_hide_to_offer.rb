class AddHideToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :hide, :boolean, default: false
  end
end
