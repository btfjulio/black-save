class AddPageToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :page, :string
  end
end
