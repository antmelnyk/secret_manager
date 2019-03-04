class UserRepository < Hanami::Repository
  def find_by_login(login)
    root.where(login: login).map_to(User).one
  end
end
