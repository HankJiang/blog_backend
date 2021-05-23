Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3001', 'api.gsxxm.com'
    resource '*',
             headers: :any,
             methods: [:get, :post, :patch, :put, :delete],
             credentials: true
  end
end
