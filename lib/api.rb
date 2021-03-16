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
        country.country_code = new_country["names"]["iso3"]
        country.language = new_country["language"]#["language"]
        country.country_phone_code = new_country["telephone"]["calling_code"]
        country.police = new_country["telephone"]["police"]
        country.ambulance = new_country["telephone"]["ambulance"]
        country.fire = new_country["telephone"]["fire"]
        country.water = new_country["water"]["short"]
        #country.vaccinations = new_country["vaccinations"]
        country.currency = new_country["currency"]["name"]
        country.currency_code = new_country["currency"]["code"]
        country.currency_symbol = new_country["currency"]["symbol"]
        country.advice = new_country["advise"]["UA"]["advise"]
        #country.neighbors = new_country["neighbors"]
    #binding.pry
        
    end

end