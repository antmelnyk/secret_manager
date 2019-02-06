require 'features_helper'

RSpec.describe 'Add a secret' do
  before do
    SecretRepository.new.clear
  end

  it 'can create a new secret encrypted in database' do
    visit '/secrets/new'

    within 'form' do
      fill_in 'Login',  with: 'New Secret'
      fill_in 'Secret', with: 'secret'

      click_button 'Add'
    end

    expect(page).to have_current_path('/secrets')
    expect(page).to have_content('New Secret')
    expect(SecretRepository.new.last.secret).to eq(Encryptor.encrypt('secret'))
  end
end
