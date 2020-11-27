

class Offer < ApplicationRecord
  after_validation :set_slug, only: %i(create, update)

  after_create :set_app_link
  after_validation :update_app_link, only: %i(update), if: :will_save_change_to_slug?

  after_validation :convert_image, only: %i(create, update), if: :will_save_change_to_page?

  has_one_attached :photo
  belongs_to :store, :inverse_of => :offers

  validates :title, presence: true
  validates :body, presence: true
  validates :link, presence: true

  def src_image
    self.photo.attached? ? Cloudinary::Utils.cloudinary_url(photo.key) : 'placeholder.jpg'
  end


  def update_app_link
    self.app_link = "savewhey.com.br/offers/#{self.to_param}"
  end

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

  def convert_image
    if self.page 
      begin
        object = LinkThumbnailer.generate(self.page)
        file = URI.open(object.images.first.src)
        self.photo.purge
        self.photo.attach(io: file, filename: "#{slug}.png", content_type: 'image/png')
        puts "Photo updated"
      rescue => exception
        puts exception
      end
    end
  end
end
