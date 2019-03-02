require 'bcrypt'

module Web
  module Controllers
    module Sessions
      class Create
        include Web::Action

        def call(params)
          user = UserRepository.new.find_by_login(requested_login)
          if !user.nil? && password_correct?(user)
            session[:user_id] = user.id
            redirect_to routes.root_path
          else
            redirect_to routes.new_session_path
          end
        end

        private

        def password_correct?(user)
          BCrypt::Password.new(user.password) == requested_password
        end

        def requested_login
          params[:session][:login]
        end

        def requested_password
          params[:session][:password_plain]
        end

        def authenticate!; end

      end
    end
  end
end
