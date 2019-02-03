RSpec.describe Web::Controllers::Secrets::Index, type: :action do
    let(:action) { described_class.new }
    let(:params) { Hash[] }
    let(:repository) { SecretRepository.new }

    before do
        repository.clear

        @secret = repository.create(login: 'Admin', secret: Encryptor.generate('secret'))
    end

    it 'is successful' do
        response = action.call(params)
        expect(response[0]).to eq(200)
    end

    it 'exposes all secrets' do
        action.call(params)
        expect(action.exposures[:secrets]).to eq([@secret])
    end
end
