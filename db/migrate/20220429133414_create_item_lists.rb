class CreateItemLists < ActiveRecord::Migration[7.0]
  def change
    create_table :item_lists do |t|
      t.integer :ItemNo
      t.integer :CategoryID
      t.string :CategoryName
      t.integer :ItemID
      t.string :ItemName
      t.float :ItemPrice

      t.timestamps
    end
  end
end
