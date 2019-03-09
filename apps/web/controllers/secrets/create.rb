module Web
  module Controllers
    module Secrets
      class Create
        include Web::Action

        expose :categories
        
        params do
          required(:secret).schema do
            optional(:title).maybe
            required(:login).filled(:str?)
            required(:secret).filled(:str?)
            required(:category).filled(:int?)
          end
        end

        def call(params)
          if params.valid?
            SecretRepository.new.create(prepared_params)

            redirect_to routes.secrets_path
          else
            @categories = CategoryRepository.new.all_for_select_hash
            self.status = 422
          end
        end

        private
        
        def prepared_params
          title = params[:secret][:title]
          login = params[:secret][:login]
          secret = Encryptor.encrypt(params[:secret][:secret])
          category_id = params[:secret][:category]
          { title: title, login: login, secret: secret, category_id: category_id }
        end
      end
    end
  end
end
