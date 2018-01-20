class HousingList::CLI

  def show_states
    states = HousingList::Scraper.new.make_states
    puts "#{states}"

  end



end
