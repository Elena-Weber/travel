class Country

    attr_accessor :name, :url, :full_name, :country_code_2, :country_code_3, :language, :country_phone_code, :police, :ambulance, :fire, :water, :vaccinations, :currency, :currency_code, :neighbors

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