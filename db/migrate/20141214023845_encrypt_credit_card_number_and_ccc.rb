class EncryptCreditCardNumberAndCcc < ActiveRecord::Migration
  def change
    rename_column :orders, :creditcard_number, :encrypted_creditcard_number
    rename_column :orders, :creditcard_ccc, :encrypted_creditcard_ccc
  end
end
