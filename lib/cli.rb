class CLI

    def run
        puts ""
        puts "*===========================================================*"
        puts "|                                                     \\_/   |"
        puts "|                                                   --(_)-- |"
        puts "|   /\\                           __     /\\       __   / \\   |"
        puts "|  /~'\\    /\\    /\\             (())   //\\\\     (())        |"
        puts "| /    \\  /~'\\  /~`\\           ((())) ///\\\\\\   ((()))       |"
        puts "|/      \\/    \\/    \\     ,.-.---)(--.--)(---'---)(.-'---'''|"
        puts "|        \\           \\,'`                                   |"
        puts "*===========================================================*"
        
        puts ""
        puts "       **********************************************"
        puts "       *                                            *"
        puts "       * Hello! Welcome to World Traveler's Guide!  *"
        puts "       *                                            *"
        puts "       **********************************************"
        API.load_countries
        find_country
    end

    def find_country
        puts ""
        puts "Enter the name of the country or type \"list\" to see the list of them."
        input = gets.chomp
        if country = Country.all.detect do |country|
            country.name == input
            end
            display_country_details(country)
            another_country
        elsif input == "list" || input == "List" || input == "LIST"
            country_pages
        else
            puts "Oops! Please make sure there are no typos or mistakes in the country name and start with a Capital Letter."
            puts ""
            find_country
        end
    end

    def display_country_details(country)
        API.load_country_details(country)
        puts ""
        puts "You have selected the country: #{country.name}"
        puts ""
        puts "Here is some useful information:"
        puts "Full name: #{country.full_name}"
        puts "Country codes: #{country.country_code_2}, #{country.country_code_3}"
        puts "Language: #{country.language}"
        puts "Country phone code: +#{country.country_phone_code}"
        puts "In case of emergency, dial: police: #{country.police}, ambulance: #{country.ambulance}, fire: #{country.fire}"
        puts "Is the tap water safe to drink? #{country.water}"
        puts "Necessary vaccinations: #{country.vaccinations}"
        puts "Currency: name: #{country.currency}, code: #{country.currency_code}"
        puts "Neigboring countries: #{country.neighbors}"
        puts ""
    end

    def country_pages
        puts ""
        puts "Browse through the countries by entering the page number: 1, 2, 3, 4, 5, 6, 7, 8 (each page contains 32 countries)."
        puts "Alternatively, enter 0 to see the whole list (256 countries) on a single page."
        puts "! Please note that the countries are in the alphabetical order !"
        input = gets.chomp.to_i
        if input == 1
           puts "*** Here are the countries on page #{input} ***"
            Country.all[input-1, 32].each.with_index(input) do |country, index|
                puts "#{index}. #{country.name}"
                end
            desired_country
        elsif input == 2
            puts "*** Here are the countries on page #{input} ***"
            Country.all[input+30, 32].each.with_index(input+31) do |country, index|
                puts "#{index}. #{country.name}"
                end
            desired_country
        elsif input == 3
            puts "*** Here are the countries on page #{input} ***"
            Country.all[input+61, 32].each.with_index(input+62) do |country, index|
                puts "#{index}. #{country.name}"
                end
            desired_country
        elsif input == 4
            puts "*** Here are the countries on page #{input} ***"
            Country.all[input+92, 32].each.with_index(input+93) do |country, index|
                puts "#{index}. #{country.name}"
                end
            desired_country
        elsif input == 5
            puts "*** Here are the countries on page #{input} ***"
            Country.all[input+123, 32].each.with_index(input+124) do |country, index|
                puts "#{index}. #{country.name}"
                end
            desired_country
        elsif input == 6
            puts "*** Here are the countries on page #{input} ***"
            Country.all[input+154, 32].each.with_index(input+155) do |country, index|
                puts "#{index}. #{country.name}"
            end
            desired_country
        elsif input == 7
            puts "*** Here are the countries on page #{input} ***"
            Country.all[input+185, 32].each.with_index(input+186) do |country, index|
                puts "#{index}. #{country.name}"
                end
            desired_country
        elsif input == 8
            puts "*** Here are the countries on page #{input} ***"
            Country.all[input+216, 32].each.with_index(input+217) do |country, index|
                puts "#{index}. #{country.name}"
                end
            desired_country
        elsif input == 0
            puts "*** Here are all the 256 countries ***"
            list_countries
            select_country
        else
            country_pages
        end
    end

    def desired_country
        puts ""
        puts "Is the country you're interested in on this page? (y/n)"
        input = gets.chomp
        if input === "y" || input === "Y"
            select_country
        elsif input === "n" || input === "N"
            country_pages
        else
            puts "Please enter Y or N:"
            desired_country
        end
    end

    def select_country
        puts ""
        puts "Please select a country by entering its number (1-256):"
        input = gets.chomp
        if input.to_i.between?(1, Country.all.count)
            country = Country.all[input.to_i-1]
            display_country_details(country)
            another_country
        else
            select_country
        end
    end

    def list_countries
        Country.all.each_with_index do |country, index|
            puts "#{index+1}. #{country.name}"
        end
    end

    def another_country
        puts ""
        puts "Would you like to get information about another country? (y/n)"
        input = gets.chomp
        if input === "y" || input === "Y"
            find_country
        elsif input === "n" || input === "N"
            puts "Bye-bye! Have a nice day! Safe travels!"
            puts "          ____                              "
            puts "     _||__|  |  ______   ______   ______    "
            puts "    (        | |      | |      | |      |   "
            puts "    /-()---() ~ ()--() ~ ()--() ~ ()--()    "
            puts " -------------------------------------------"
            puts ""
        else
            puts "Please enter Y or N:"
            another_country
        end
    end
end

