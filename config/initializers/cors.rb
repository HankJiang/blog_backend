Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost', 'gsxxm.com', '.gsxxm.com', '127.0.0.1'
    resource '*',
             headers: :any,
             methods: [:get, :post, :patch, :put, :delete],
             credentials: true
  end
end
