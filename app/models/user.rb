require "securerandom"

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true

  ROLES = %w[admin manager employee].freeze

  def admin?
    role == "admin"
  end

  def manager?
    role == "manager"
  end

  def employee?
    role == "employee"
  end

  def active?
    !deactivated
  end
end
