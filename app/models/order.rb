class Order < ActiveRecord::Base
  has_many :order_products
  has_many :products, through: :order_products
  attr_encrypted :creditcard_number, key: 'sec99#457yp'
  attr_encrypted :creditcard_ccc, key: 'sec99#457yp'
end
