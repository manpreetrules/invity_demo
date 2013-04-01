ENV['FACEBOOK_APP_ID']     = '517207381670518'
ENV['FACEBOOK_APP_SECRET'] = '2abd7b8eb60ea157e26bd6dd2bf133ba'

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], scope: "email, xmpp_login"
end