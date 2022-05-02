class CreateSaleDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_details do |t|
      t.integer :SaleNo
      t.integer :CategoryID
      t.string :CategoryName
      t.integer :ItemId
      t.string :ItemName
      t.string :TotalQuantity
      t.decimal :ItemPrice
      t.decimal :TotalCost
      t.datetime :DateofSale
      t.string :CustomerName
      t.integer :OrderID

      t.timestamps
    end
  end
end
