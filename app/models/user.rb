class User < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_secure_password
end
