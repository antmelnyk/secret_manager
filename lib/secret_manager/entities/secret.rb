class Secret < Hanami::Entity
  def decrypted_secret
    Encryptor.decrypt(secret)
  end
end
