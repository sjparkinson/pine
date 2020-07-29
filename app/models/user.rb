# frozen_string_literal: true

class User < ApplicationRecord
  auto_strip_attributes :email, :display_name

  validates :email, presence: true, uniqueness: true
  validates :display_name, presence: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :password, length: { minimum: 6 }, allow_nil: true, on: :update

  has_secure_password

  has_many :trees, dependent: :destroy
end
