class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku
      t.string :title
      t.text :description
      t.integer :quantity
      t.string :weight
      t.integer :category_id
      t.boolean :featured
      t.decimal :price

      t.timestamps
    end
  end
end
