class Offer < ApplicationRecord
  after_validation :set_slug, only: %i(create, :update)
  after_create :set_app_link


  has_one_attached :photo

  validates :title, presence: true
  validates :body, presence: true
  validates :link, presence: true
  validates :photo, presence: true

  belongs_to :store, :inverse_of => :offers

  def set_app_link
    self.app_link = "savewhey.com.br/offers/#{self.to_param}"
    self.save
  end

  def set_slug
    self.slug = title.to_s.parameterize
  end 

  def to_param
    "#{id}-#{slug}"
  end
end
