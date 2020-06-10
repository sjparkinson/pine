# frozen_string_literal: true

class Tree < ApplicationRecord
  auto_strip_attributes :common_name, :scientific_name

  validates :common_name, presence: true

  validates :images, limit: { max: 6 }, content_type: [:png, :jpg, :jpeg], size: { less_than: 8.megabytes }

  has_many_attached :images

  belongs_to :user

  def can_edit?(user)
    return self.user == user
  end
end
