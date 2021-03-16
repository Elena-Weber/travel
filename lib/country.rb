class Country
    attr_accessor :name, :language, :currency

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

end