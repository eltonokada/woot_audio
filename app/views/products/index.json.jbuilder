json.array!(@products) do |product|
  json.extract! product, :id, :sku, :title, :description, :quantity, :weight, :category_id, :featured, :price
  json.url product_url(product, format: :json)
end
