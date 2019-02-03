class Secret < Hanami::Entity
    def secret
        Encryptor.decrypt(super)
    end
end
