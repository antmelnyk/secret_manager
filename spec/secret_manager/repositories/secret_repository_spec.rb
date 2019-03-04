RSpec.describe SecretRepository, type: :repository do
  let(:repository) { SecretRepository.new }
  let(:category) { CategoryRepository.new.create(title: 'Test') }

  it 'returns secrets by category' do
    repository.create(login: 'Test1', secret: Encryptor.encrypt('secret'), category_id: category.id)
    repository.create(login: 'Test2', secret: Encryptor.encrypt('secret'), category_id: category.id)
    
    test_secrets = repository.find_by_category(category.id)

    expect(test_secrets[1].login).to eq('Test2')
  end
end
