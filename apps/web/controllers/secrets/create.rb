module Web
    module Controllers
        module Secrets
            class Create
                include Web::Action

                def call(params)
                    encrypted_secret = Encryptor.encrypt(params[:secret])

                    SecretRepository.new.create(params[:login], encrypted_secret)
                end
            end
        end
    end
end
