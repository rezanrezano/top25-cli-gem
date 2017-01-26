class Top25::Cli

  def search_for
    search =""
    puts "Search for the best in the world, choose on of the follwing number"
    puts "1. Hotels\n2. Restaurants\n3. Beaches"
    search = gets.strip
    case search
    when "1"
        make_places("Hotels")
        display_places
      when "2"
        make_places("Restaurants")
        display_places
      when "3"
        make_places("Beaches")
        display_places
      else
        puts "sorry, you only can search hotels,restaurants and beaches"
      end
      answer = ""
      puts "search_for or exit?"
      answer = gets.strip
      unless answer == "exit"
        search_for
      end
  end

  def make_places(name)
    scraper = Top25::Scraper.new
    arrofplaces = scraper.scrap(name)
    Top25::Place.create_from_collection(arrofplaces)
  end

  def display_places
    Top25::Place.all.each do |pl|
      puts "#{pl.num}. #{pl.name}-based in: #{pl.location}"
    end
     puts "----------------------".colorize(:green)
  end


end
