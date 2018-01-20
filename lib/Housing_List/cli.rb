class HousingList::CLI

  def show_states
    HousingList::Scraper.new.make_states.each do |state|
        state = HousingList::State.new(state)
    end
      i = 1
      HousingList::State.all.each do |state|
      puts "#{i}. #{state.name}"
      i += 1

    end


  end







end
