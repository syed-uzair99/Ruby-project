class CreateStockDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_details do |t|
      t.integer :StockNo
      t.integer :CategoryID
      t.string :CategoryName
      t.integer :ItemId
      t.string :ItemName
      t.integer :TotalStock
      t.integer :SoldStock
      t.integer :RemainingStock

      t.timestamps
    end
  end
end
