class Restaurant < ApplicationRecord
  CATEGORIES = %w[chinese italian japanese french belgian].freeze
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :name, presence: true
  validates :address, presence: true
  has_many :reviews, dependent: :destroy
end
