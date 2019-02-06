RSpec.describe Web::Controllers::Secrets::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[secret: { login: 'Admin', secret: 'secret' }] }
  let(:repository) { SecretRepository.new }

  before do
    repository.clear
  end

  context 'with valid params' do
    it 'creates a new secret' do
      action.call(params)
      secret = repository.last

      expect(secret.id).to_not be_nil
      expect(secret.login).to eq(params.dig(:secret, :login))
    end

    it 'redirects the user to the secrets' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/secrets')
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[secret: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:secret, :login)).to eq(['is missing'])
      expect(errors.dig(:secret, :secret)).to eq(['is missing'])
    end
  end
end
