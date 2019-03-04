module Web
  module Controllers
    module Secrets
      class New
        include Web::Action

        expose :categories

        def call(params)
          @categories = CategoryRepository.new.all_for_select_hash
        end
      end
    end
  end
end
