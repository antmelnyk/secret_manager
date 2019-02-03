require 'bcrypt'

class Secret < Hanami::Entity
    def secret
        begin
            Encryptor.new(super)
        rescue BCrypt::Errors::InvalidHash => e
            "Error happened: #{e.inspect}"
        end
    end
end
