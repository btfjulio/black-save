require 'mechanize'
require "open-uri"


# def attach_photo(offer, product)
#   link = product["product_photos_attributes"].find { |photo| photo['name'] == 'Principal' }.dig('url')
#   file = URI.open(link)
#   offer.photo.attach(
#     io: file, 
#     filename: 'nes.png', 
#     content_type: 'image/png'
#   )
# end

# client = SWApi.new
# client.import_products

STORES = [
  {
    name: 'Amazon',
    logo: 'amz-logo.png'
  },
  {
    name: 'Netshoes',
    logo: 'net-logo.png'
  },
  {
    name: 'Corpo Perfeito',
    logo: 'cp-logo.png'
  },
  {
    name: 'Centauro',
    logo: 'cent-logo.png'
  },
  {
    name: 'Madrugao',
    logo: 'mdg-logo.png'
  }
]

# stores.each do |store|
#   new_store = Store.create(store)
#   puts "Criada loja #{new_store.name}"
# end

Offer.all.each do |offer|
  offer.update!(
    slug: offer.title.parameterize,
    app_link: offer.set_app_link
  )
end