require_relative './scraper'

class AddressCollector

  SEARCH_STRING_LIST = ['roseville','roseville','la','de','he','le','ru','gr','po',
                        'th','es','se','re','re','te','an']

  attr_accessor :addresses

  def initialize
    @addresses = []
  end

  def get_addresses_for(search_string)
    new_ones = 0
    scraper = Scraper.new(search_string)
    scraper.get_addresses
    scraper.addresses.each do |address|
      if !addresses.include?(address)
        addresses << address
        new_ones += 1
      end
    end
    new_ones
  end

  def get_all_addresses
    for search_string in SEARCH_STRING_LIST[0..1] do
      # puts "There are #{addresses.size} addresses"
      # puts "#{get_addresses_for(search_string)} new addresses added"
      get_addresses_for(search_string)
    end
    addresses
  end

end

# AddressCollector.new.get_all_addresses
