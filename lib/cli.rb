class CLI

    def run
        puts "Hello! Welcome to the World Atlas!"
        puts "Here is the list of countries in the atlas:"
        API.load_countries
        list_countries
        menu
    end

    def list_countries
        Country.all.each_with_index do |country, index|
            puts "#{index+1}. #{country["name"]}"
        end
    end

    def menu
        puts "Please select a country by entering its number (1-256):"
        input = gets.chomp
    end

end