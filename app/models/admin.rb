class Admin < ApplicationRecord
  has_secure_password  # requires bcrypt gem
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
