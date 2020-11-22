class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :body
      t.string :link
      t.string :coupon

      t.timestamps
    end
  end
end
