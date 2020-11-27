class Offer < ApplicationRecord
  has_one_attached :photo

  validates :title, presence: true
  validates :body, presence: true
  validates :link, presence: true
  validates :photo, presence: true

  belongs_to :store, :inverse_of => :offers

end
