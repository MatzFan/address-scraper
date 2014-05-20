require 'sinatra'
require_relative './scraper'
require_relative './parser'
require_relative './address_collector'

get '/' do
  addresses = AddressCollector.new.get_all_addresses
  parsed_addresses = addresses.map { |address| Parser.new.parse(address) }
  "#{parsed_addresses.join('^')}"
end
