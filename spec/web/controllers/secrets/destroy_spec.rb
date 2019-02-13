RSpec.describe Web::Controllers::Secrets::Destroy do
  let(:action) { described_class.new }
  let(:repository) { SecretRepository.new }

  before do
    repository.clear
  end

  it 'destroys secret by id' do
    secret = repository.create(login: 'Admin', secret: Encryptor.encrypt('secret'))
    action.call({ secret: { id: secret.id }})

    expect(repository.find(secret.id)).to be_nil
  end
end
