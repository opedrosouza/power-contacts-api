# frozen_string_literal: true

# Model that represents jwt tokens that was revocated when the user do the logout
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
  self.table_name = 'jwt_denylists'
end
