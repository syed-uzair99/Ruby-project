class CreateItemCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :item_categories do |t|
      t.integer :C.No
      t.integer :CategoryID
      t.string :CategoryName

      t.timestamps
    end
  end
end
