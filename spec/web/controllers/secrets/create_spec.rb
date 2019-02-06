RSpec.describe Web::Controllers::Secrets::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[secret: { login: 'Admin', secret: 'secret' }] }
  let(:repository) { SecretRepository.new }

  before do
    repository.clear
  end

  it 'creates a new secret' do
    action.call(params)
    secret = repository.last

    expect(secret.id).to_not be_nil
  end

  it 'redirects the user to the secrets' do
    response = action.call(params)

    expect(response[0]).to eq(302)
    expect(response[1]['Location']).to eq('/secrets')
  end
end
