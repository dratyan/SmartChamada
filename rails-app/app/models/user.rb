class User < ApplicationRecord
  before_save { self.username = username.downcase }

  has_many :courses

  validates :nome, presence: true
  validates :username, presence: true, uniqueness: true
  validates :cartao, presence: true, uniqueness: true

  has_secure_password
end
