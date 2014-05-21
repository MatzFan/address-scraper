require 'sinatra'
require 'slim'
require_relative './scraper'
require_relative './parser'

get '/' do
  'working'
end

post '/num_addresses' do
  search_string = params[:search_string]
  scraper = Scraper.new(search_string)
  @num_addresses = scraper.num_addresses
  slim :num_addresses
end

post '/addresses_for' do
  search_string = params[:search_string]
  page_num = params[:page_num]
  scraper = Scraper.new(search_string)
  raw_addresses = scraper.get_addresses_on_page(page_num)
  parsed_addresses = raw_addresses.map { |address| Parser.new.parse(address) }
  @addresses = parsed_addresses.join('^')
  slim :addresses
end
