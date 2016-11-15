OmniAuth.config.logger = Rails.logger
 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '961463639605-v3qn25s8tle1uu0dj8tes3gt7mtn6o4g.apps.googleusercontent.com', 'NhohizJ7bKeP_G3qa2qJWA0S', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}, skip_jwt: true}
end