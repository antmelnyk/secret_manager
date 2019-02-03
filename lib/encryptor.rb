require 'bcrypt'

class Encryptor
    attr_reader :value
    DEFAULT_COST = BCrypt::Engine.cost

    def self.generate(input, cost: DEFAULT_COST)
        BCrypt::Password.create(input, cost: cost)
    end

    def initialize(encrypted_password)
        @value = BCrypt::Password.new(encrypted_password)
    end

    def ==(other)
        @value == other
    end
end