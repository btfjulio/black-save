require 'mechanize'

class ProductUpdater
  def initialize(_options = {})
    @page = 1
    @agent = Mechanize.new
    @token = ENV['API_SAVEWHEY_TOKEN']
    @user = ENV['API_SAVEWHEY_USER']
  end

  def access_api
    products = JSON.parse(make_request.body)
    products.each { |product| save_product(product) }
    puts "All products imported"
  end

  def save_product(product)
    # check if already exists on DB
    product.merge!(parse_product(product))
    db_product = Product.where(api_code: product['id']).first
    if db_product.nil?
      product.except!('id', 'brand', 'category', 'subcategory')
      p = Product.create!(product)
      "#{p.name} - #{p.weight} - #{p.flavor} "
    else
      puts "#{db_product.name} - #{db_product.weight} - #{db_product.flavor} already on DB"
    end
  end

  def make_request
    api_endpoint = "https://savewhey-api.herokuapp.com/api/v2/base_suplements?page=#{@page}&#{ENV['API_SAVEWHEY_USER']}&#{ENV['API_SAVEWHEY_TOKEN']}"
    @agent.get(api_endpoint)
  rescue StandardError => e
    puts e
  end

  def parse_product(product)
    {
      'category_id': Category.where(name: product['category']).first&.id,
      'subcategory_id': Subcategory.where(name: product['subcategory']).first&.id,
      'brand_id': Brand.where(search_name: product['brand']['search_name']).first&.id,
      'api_code': product['id']
    }
  end
end