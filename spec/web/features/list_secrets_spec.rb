require 'features_helper'

RSpec.describe 'List secrets' do
    let(:repository) { SecretRepository.new }
    before do
        repository.clear

        repository.create(login: 'Admin', secret: Encryptor.encrypt('secret'))
        repository.create(login: 'Superadmin', secret: Encryptor.encrypt('secret2'))
    end

    it 'displays secrets on the page' do
        visit '/secrets'

        within '.secret-items' do
            expect(page).to have_css('.secret-item', count: 2)
        end
    end
end
