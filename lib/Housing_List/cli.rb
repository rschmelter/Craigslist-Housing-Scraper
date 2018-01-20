class HousingList::CLI

  def show_states
    states_array = []
    HousingList::Scraper.new.make_states.each do |state|
        states_array << state
        state = HousingList::State.new(state)

    end

    puts "Welcome! To get started, type 'list' to show a list of states and areas with available rentals"
    valid = false
    while valid == false
      input = gets.strip
      if input.downcase == "list"
        valid = true
        i = 1
        states_array.each do |state|
          puts "#{i}. #{state}"
          i += 1
        end
      else
        puts "Invalid input. Please type 'list' to show states"
      end
    end
    puts "Type the number of the state to see a list of cities with available rentals."
    valid = false
    while valid == false
      input = gets.strip
      state_number = input.to_i
      if (1..52).include?(state_number)
        valid = true
        selection = states_array[state_number - 1]
        show_cities(selection)
      else
        puts "Invalid input. Please choos a number between 1 and 52"
      end
    end

  end

  def show_cities(state)
    puts "#{state}"
  end








end
