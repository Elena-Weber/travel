class API
    
    #def self.load_countries
    #    resp = RestClient.get("https://travelbriefing.org/countries.json")
    #    countries = JSON.parse(resp.body)
    #    countries_array = countries[:results]
    #    country = countries_array.collect do |c|
    #    Country.new(name)
    #    end
    #end

    #def self.country_details()

    #end

    URL = "https://travelbriefing.org/countries.json"

    def self.load_countries
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
    countries = JSON.parse(response.body)
    countries.each_with_index {|country, index|puts "#{index+1}. #{country["name"]}"}
    #puts countries.count
    end
end