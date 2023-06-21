class User < ApplicationRecord
  # Validation for Name
  validates :name, presence: true, length: { minimum: 2 }

  # Validation for Username
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }

  # Validation for Email
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: '- Invalid Email!' }

  # Validation for Password
  has_secure_password
  validates :password, format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x, message: '- Unsecure Password!' }
end
