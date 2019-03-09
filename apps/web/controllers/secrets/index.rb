module Web
  module Controllers
    module Secrets
      class Index
        include Web::Action

        expose :secrets, :categories

        def call(params)
          @categories = CategoryRepository.new.all
          @secrets = SecretRepository.new.all
        end
      end
    end
  end
end
