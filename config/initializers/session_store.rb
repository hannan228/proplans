if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_network_bundle", domain: "all-network-package-app-by-abdul-api.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_network_bundle_app"
end
