class Encryptor

    def self.encrypt(data)
        cipher = OpenSSL::Cipher::AES.new(192, :CBC).encrypt
        cipher.key = ENV['ENCRYPTOR_KEY']
        s = cipher.update(data) + cipher.final
        s.unpack('H*')[0].upcase
    end

    def self.decrypt(encrypted)
        cipher = OpenSSL::Cipher::AES.new(192, :CBC).decrypt
        cipher.key = ENV['ENCRYPTOR_KEY']
        s = [encrypted].pack("H*").unpack("C*").pack("c*")

        cipher.update(s) + cipher.final
    end

end
