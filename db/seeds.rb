require 'mechanize'
require "open-uri"



class SWApi
  BASE_URL = "https://savewhey-api.herokuapp.com/api/v2/base_suplements"

  def initialize(_options = {})
    @page = 1
    @agent = Mechanize.new
    @token = ENV['API_SAVEWHEY_TOKEN']
    @user = ENV['API_SAVEWHEY_USER']
  end

  def import_products
    products = JSON.parse(make_request.body)
    products.each do |product|     
      offer = Offer.new(parse_product(product)) 
      attach_photo(offer, product)
      offer.save!
    end
    puts 'All products imported'
  end

  def make_request
    api_endpoint = "#{BASE_URL}?page=#{@page}&#{ENV['API_SAVEWHEY_USER']}&#{ENV['API_SAVEWHEY_TOKEN']}"
    @agent.get(api_endpoint)
  rescue StandardError => e
    puts e
  end

  def parse_product(product)
    {
      title: product['name'],
      body: "#{product['name']}-#{product['weight']}\n.Entre pelo link, user o cupom e pegue o desconto",
      coupon: %i(SAVEWHEY SAVEWHEY11 SUPLE30 SAVE-BLACK).sample,
      price: rand(10.00...100.00),
      link: 'http://www.link.com.br'
    }
  end
end

def attach_photo(offer, product)
  link = product["product_photos_attributes"].find { |photo| photo['name'] == 'Principal' }.dig('url')
  file = URI.open(link)
  offer.photo.attach(
    io: file, 
    filename: 'nes.png', 
    content_type: 'image/png'
  )
end

# client = SWApi.new
# client.import_products

stores = [
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
end