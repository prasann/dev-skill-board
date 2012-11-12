Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '534548406124-htf1tprkd6efcb4tv0urg9djhukpd8r8.apps.googleusercontent.com', 'ceb9JPbTCrrEXgWJ8gGWTCmL'
end