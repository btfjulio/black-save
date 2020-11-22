class Offer < ApplicationRecord
  has_one_attached :photo

  validates :title, presence: true
  validates :body, presence: true
  validates :link, presence: true
  validates :photo, presence: true
end
