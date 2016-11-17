class Funcionario < ApplicationRecord
  self.primary_key = :cpf
  attr_accessor :remember_token
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  class << self
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # Remembers a funcionario in the database for use in persistent sessions.
  def remember
    self.remember_token = Funcionario.new_token
    update_attribute(:remember_digest, Funcionario.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end


  # Forgets a funcionario.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
