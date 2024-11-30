json.extract! product, :id, :name, :description, :stock, :price, :category_id, :size_id, :color_id, :created_at, :updated_at
json.url product_url(product, format: :json)
