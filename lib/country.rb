class Country

    attr_accessor :name, :url, :country_code, :language, :currency, :currency_code, :currency_symbol, :country_phone_code, :police, :ambulance, :fire, :water, :vaccinations

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

end