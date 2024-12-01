json.extract! sale, :id, :total, :is_canceled, :user_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
