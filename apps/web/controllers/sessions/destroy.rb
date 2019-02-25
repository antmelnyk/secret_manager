module Web
  module Controllers
    module Sessions
      class Destroy
        include Web::Action

        def call(params)
          session[:user_id] = nil
          redirect_to routes.new_session_path
        end
      end
    end
  end
end
