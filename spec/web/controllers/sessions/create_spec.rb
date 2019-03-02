RSpec.describe Web::Controllers::Sessions::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[session: { login: 'User', password_plain: 'Password' }] }
  let(:repository) { UserRepository.new }

  before do
    repository.clear
  end

  context 'with valid credentials' do
    it 'creates a new session for user' do
      repository.create(login: 'User', password: BCrypt::Password.create('Password'))
      response = action.call(params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/')
    end
  end

  context 'with invalid credentials' do
    it 'redirects to login form' do
      repository.create(login: 'User', password: BCrypt::Password.create('WrongPassword'))
      response = action.call(params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/sessions/new')
    end
  end

end
