require "securerandom"

class User < ApplicationRecord
  has_secure_password

  has_many :sales

  validates :username, :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :phone, format: { with: /\A\d{10}\z/ }, allow_blank: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

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
