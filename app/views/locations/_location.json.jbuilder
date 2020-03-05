json.extract! location, :id, :street, :city, :psc, :created_at, :updated_at
json.url location_url(location, format: :json)
