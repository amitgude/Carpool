OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1564357213816540', '5ccc7aec92c4b13fbafdcba082e2275d'
end