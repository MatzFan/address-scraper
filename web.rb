require 'sinatra'
require_relative './scraper'
require_relative './parser'
require_relative './address_collector'

@addresses = 'waiting'

get '/' do
  @addresses
end

post '/get_addresses' do
  addresses = AddressCollector.new.get_all_addresses
  parsed_addresses = addresses.map { |address| Parser.new.parse(address) }
  @addresses = "done^#{parsed_addresses.join('^')}"
end
