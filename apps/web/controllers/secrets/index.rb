module Web
    module Controllers
        module Secrets
            class Index
                include Web::Action

                expose :secrets

				def call(params)
					@secrets = SecretRepository.new.all
				end
            end
        end
    end
end
