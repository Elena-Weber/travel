class CLI

    def run
        puts "Hello! Welcome to the World Traveller's Guide!"
        puts "Here is the list of countries in the guide:"
        API.load_countries
        list_countries
        select_country
        another_country
    end

    def list_countries
        Country.all.each_with_index do |country, index|
            puts "#{index+1}. #{country.name}"
        end
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
        puts "Country code: #{country.country_code}"
        puts "Language: #{country.language}"
        puts "Country phone code: +#{country.country_phone_code}"
        puts "In case of emergency, dial: police: #{country.police}, ambulance: #{country.ambulance}, fire: #{country.fire}"
        puts "Is the tap water safe to drink? #{country.water}"
        puts "Necessary vaccinations: #{country.vaccinations}"
        puts "Currency: name: #{country.currency}, code: #{country.currency_code}, symbol: #{country.currency_symbol}"
        puts "Travel advisory: #{country.advice}"
        puts "Neigboring countries: #{country.neighbors}"
    end

    def another_country
        puts "Would you like to get information about another country? (y/n)"
        input = gets.chomp
        if input === "y" || input === "Y"
            list_countries
            select_country
            another_country
        elsif input === "n" || input === "N"
            puts "Bye! Have a nice day!"
        else
            puts "Please enter Y or N:"
            another_country
        end
    end

end

