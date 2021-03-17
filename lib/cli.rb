class CLI

    def run
        puts "**********************************************"
        puts "*                                            *"
        puts "* Hello! Welcome to World Traveller's Guide! *"
        puts "*                                            *"
        puts "**********************************************"
        puts "Please enter the name of the country or type \"list\" to see the full list."
        API.load_countries

        type_country
        #list_countries
        #select_country
        #another_country
    end

    def list_countries
        Country.all.each_with_index do |country, index|
            puts "#{index+1}. #{country.name}"
        end
    end

    def type_country
        input = gets.chomp

        country = Country.all.detect do |country|
            country.name == input
        end

        if input == country.name
            puts "hi"
        elsif input == "list"
            puts "list"
        else
            puts "bye"
        end
#binding.pry 
    end

    def select_country
        puts "Please select a country by entering its number (1-256):"
        input = gets.chomp
        if !input.to_i.between?(1, Country.all.count)
            list_countries
            select_country
        else
            country = Country.all[input.to_i-1]
            display_country_details(country)
        end
    end

    def display_country_details(country)
        API.load_country_details(country)
        puts "Here is some useful information about #{country.name}:"
        puts "Full name: #{country.full_name}"
        puts "Country codes: #{country.country_code_2}, #{country.country_code_3}"
        puts "Language: #{country.language}"
        puts "Country phone code: +#{country.country_phone_code}"
        puts "In case of emergency, dial: police: #{country.police}, ambulance: #{country.ambulance}, fire: #{country.fire}"
        puts "Is the tap water safe to drink? #{country.water}"
        puts "Necessary vaccinations: #{country.vaccinations}"
        puts "Currency: name: #{country.currency}, code: #{country.currency_code}, symbol: #{country.currency_symbol}"
        puts "Travel advisory: #{country.advice}"
        puts "Neigboring countries: #{country.neighbors}"
        puts " *===========================================================*"
        puts " |                                                     \\_/   |"
        puts " |                                                   --(_)-- |"
        puts " |   /\\                           __     /\\       __   / \\   |"
        puts " |  /~'\\    /\\    /\\             (())   //\\\\     (())        |"
        puts " | /    \\  /~'\\  /~`\\           ((())) ///\\\\\\   ((()))       |"
        puts " |/      \\/    \\/    \\     ,.-.---)(--.--)(---'---)(.-'---'''|"
        puts " |        \\           \\,'`                                   |"
        puts " *===========================================================*"

    end

    def another_country
        puts "Would you like to get information about another country? (y/n)"
        input = gets.chomp
        if input === "y" || input === "Y"
            list_countries
            select_country
            another_country
        elsif input === "n" || input === "N"
            puts "Bye-bye! Have a nice day! Safe travels!"
            puts "          ____                              "
            puts "     _||__|  |  ______   ______   ______    "
            puts "    (        | |      | |      | |      |   "
            puts "    /-()---() ~ ()--() ~ ()--() ~ ()--()    "
            puts " -------------------------------------------"
        else
            puts "Please enter Y or N:"
            another_country
        end
    end

end

