require 'sinatra'
require_relative './scraper'
require_relative './parser'

get '/' do
  parser = Parser.new
  scraper = Scraper.new('roseville')
  scraper.get_addresses
  addresses = scraper.addresses.map { |address| parser.parse(address) }
  "<div>#{addresses.join('</div><div>')}</div>"
end
