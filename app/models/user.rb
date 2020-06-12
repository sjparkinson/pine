# frozen_string_literal: true

class User < ApplicationRecord
  auto_strip_attributes :email, :display_name

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :display_name, presence: true

  has_secure_password

  has_many :trees, dependent: :destroy
end
