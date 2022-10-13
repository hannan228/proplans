# frozen_string_literal: true

if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_network_bundle', domain: 'buyfun.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_network_bundle_app'
end
