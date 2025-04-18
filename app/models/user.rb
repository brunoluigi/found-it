class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :items, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  normalizes :name, with: ->(n) { n.strip }
  normalizes :phone, with: ->(p) { p.gsub(/\D/, '') }

  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\d+\z/, message: "must contain only digits" }
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
end
