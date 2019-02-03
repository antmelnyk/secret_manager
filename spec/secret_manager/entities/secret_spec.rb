RSpec.describe Secret, type: :entity do
    it 'can be initialized with attributes' do
        secret = Secret.new(login: 'login', secret: Encryptor.encrypt('secret'))

        expect(secret.login).to eq('login')
        expect(secret.secret).to eq('secret')
    end
end
