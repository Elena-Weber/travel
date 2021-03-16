class Country

    attr_accessor :name, :url, :language, :currency, :currency_code, :country_code, :emergency, :vaccinations

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