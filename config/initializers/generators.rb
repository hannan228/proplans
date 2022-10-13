# frozen_string_literal: true

# https://pawelurbanek.com/uuid-order-rails
# https://www.youtube.com/watch?v=iJY09LPdTPE
Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end
