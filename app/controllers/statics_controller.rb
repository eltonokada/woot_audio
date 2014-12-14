class StaticsController < ApplicationController

  respond_to :html

  def home
    @featured_products = Product.where(featured: true)    
  end

end
