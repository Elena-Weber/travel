class CLI

    def run
        puts "Hello! Welcome to the World Traveller's Guide!"
        puts "Here is the list of countries in the guide:"
        API.load_countries
        list_countries
        menu
    end

    def list_countries
        Country.all.each_with_index do |country, index|
            puts "#{index+1}. #{country.name}"
        end
    end

    def menu
        puts "Please select a country by entering its number (1-256):"
        input = gets.chomp
        if !input.to_i.between?(1, Country.all.count)
            list_countries
            menu
        else
            country = Country.all[input.to_i-1]
            display_country_details(country)
        end
        #binding.pry
    end

    def display_country_details(country)
        API.load_country_details(country)
        puts "Here is some useful information about #{country.name}:"
        puts "Language: #{}"
        puts "Currency: #{}"
        puts "Phone code: #{}"
        puts "Necessry vaccinations: #{}"
    end

end