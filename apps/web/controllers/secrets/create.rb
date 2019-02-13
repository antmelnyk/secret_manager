module Web
  module Controllers
    module Secrets
      class Create
        include Web::Action

        params do
          required(:secret).schema do
            optional(:title)
            required(:login).filled(:str?)
            required(:secret).filled(:str?)
          end
        end

        def call(params)
          if params.valid?
            SecretRepository.new.create(prepared_params[:secret])

            redirect_to routes.secrets_path
          else
            self.status = 422
          end
        end

        private
        
        def prepared_params
          params[:secret][:secret] = Encryptor.encrypt(params[:secret][:secret])
          params
        end
      end
    end
  end
end
