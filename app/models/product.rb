class Product < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  has_many :order_products
  has_many :orders, through: :order_products
end
