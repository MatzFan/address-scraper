require 'shellwords'

class Scraper

  PC_URL = "http://www.jerseypost.com/tools/postcode-address-finder/"
  CLICK = "Click here for address information"

  attr_reader :addresses

  def initialize(search_string)
    @search_string = Shellwords.escape(search_string) # converts to Bourne-friendly string
    @addresses = []
  end

  # private
  def get_addresses_on_page(page_num)
    address_block = get_source(page_num).match(/#{CLICK}">(.*)<\/select>/mu)[1]
    adds = address_block.split(/<\/?option>/).map(&:strip)
    # need to select only odd values, as even ones are ""
    new_addresses = adds.values_at(* adds.each_index.select {|i| i.odd?})
    new_addresses.each { |a| @addresses << a }
  end

  def num_addresses
    source = get_source(0).force_encoding(Encoding::UTF_8)
    num = source.match(/<h3>There are <span>(.*) results/)[1]
    num == 'no' ? 0 : num.to_i
  end

  def get_source(page_num)
    source = `curl -s #{PC_URL} -G -d string=#{@search_string}\
               -d search=Find+an+Address -d first=#{page_num}`
    @source = source.force_encoding(Encoding::UTF_8)
  end

end
