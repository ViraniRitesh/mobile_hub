json.extract! product, :id, :name, :brand, :colour, :ram, :storage, :os, :description, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
