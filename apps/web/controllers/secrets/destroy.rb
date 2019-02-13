module Web
  module Controllers
    module Secrets
      class Destroy
        include Web::Action

        def call(params)
          SecretRepository.new.delete(params[:secret][:id])

          redirect_to routes.secrets_path
        end
      end
    end
  end
end
