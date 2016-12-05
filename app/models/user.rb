class User < ApplicationRecord
  include BCrypt

  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true,
            length: { minimum: 5}

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
