class API

    URL = "https://travelbriefing.org/countries.json"

    def self.load_countries
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
        countries = JSON.parse(response.body)
        country = countries.collect do |count|
            name = count["name"]
            url = count["url"]
            Country.new(name, url)
        end
        
    
    end

    def self.load_country_details(country)
        uri = URI.parse(country.url)
        response = Net::HTTP.get_response(uri)
        response.body
        new_country = JSON.parse(response.body)
        country.name = new_country["names"]["name"]
        country.language = new_country["language"]#["language"]
        country.country_code = new_country["telephone"]["calling_code"]
        country.emergency = new_country["telephone"]["calling_code"]
        #country.vaccinations = 
        country.currency = new_country["currency"]["name"]
        country.currency_code = new_country["currency"]["code"]
        #country.neighbors = 
    binding.pry
        
    end

end