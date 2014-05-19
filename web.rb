require 'sinatra'
require_relative './scraper'

get '/' do
  s = Scraper.new('roseville')
  s.get_addresses
  "<div>#{s.addresses.join('</div><div>')}</div>"
end
