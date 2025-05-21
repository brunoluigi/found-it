class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :items, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  normalizes :name, with: ->(n) { n.strip }
  normalizes :phone, with: ->(p) { p.gsub(/\D/, "") }

  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\d+\z/, message: "must contain only digits" }, allow_blank: true
  validates :password, length: { minimum: 8 }, if: -> { password.present? }

  def self.find_or_create_from_omniauth(auth)
    user = find_by(provider: auth.provider, uid: auth.uid)
    if user
      user
    else
      email = auth.info.email
      user = find_by(email_address: email)
      if user
        user.update(provider: auth.provider, uid: auth.uid)
        user
      else
        create(
          provider: auth.provider,
          uid: auth.uid,
          name: auth.info.name || email,
          email_address: email,
          password: SecureRandom.hex(16)
        )
      end
    end
  end
end
