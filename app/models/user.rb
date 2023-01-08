class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :name, :email, uniqueness: true
  validates :password, length: { in: 6..20 }
end
