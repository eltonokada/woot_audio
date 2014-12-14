class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :phone
      t.string :creditcard_number
      t.string :creditcard_type
      t.string :creditcard_holder
      t.string :creditcard_valid_date
      t.string :creditcard_ccc

      t.timestamps
    end
  end
end
