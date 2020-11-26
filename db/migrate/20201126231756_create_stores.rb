class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :freigth_rule
      t.string :logo

      t.timestamps
    end
  end
end
