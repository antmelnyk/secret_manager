module Web
  module Controllers
    module Secrets
      class Create
        include Web::Action

        def call(params)
          new_secret = params[:secret]
          SecretRepository.new.create({ login: new_secret[:login], secret: Encryptor.encrypt(new_secret[:secret]) })

          redirect_to '/secrets'
        end
      end
    end
  end
end
