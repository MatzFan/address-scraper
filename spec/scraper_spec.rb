require './scraper'

describe Scraper do

  let(:scraper) { Scraper.new('sunningdale') }

  context "#get_source" do

      specify "should return the page source for given search string" do
        expect(scraper.get_source(0)).to include 'Sunningdale'
      end

  end # of context

end # of describe
