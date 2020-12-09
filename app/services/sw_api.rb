class SwApi
  BASE_URL = "https://savewhey-api.herokuapp.com/api/v2/base_suplements"

  attr_reader :products

  def initialize(_options = {})
    @page = 1
    @agent = Mechanize.new
    @token = ENV['API_SAVEWHEY_TOKEN']
    @user = ENV['API_SAVEWHEY_USER']
  end

  def call
    products = JSON.parse(make_request.body)
    @products = products.map { |product| parse_product(product) }
    puts 'All products imported'
  end

  def create_offers
    @products.map do |product|     
      offer = Offer.new(product) 
      # attach_photo(offer, product)
      offer.save!
    end
  end

  def random_sup
    sample = @products.sample
    @products.reject! {|product| product == sample }
    sample
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