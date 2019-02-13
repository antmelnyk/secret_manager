RSpec.describe Web::Views::Secrets::Index, type: :view do
    let(:exposures) { Hash[secrets: []] }
    let(:template)  { Hanami::View::Template.new('apps/web/templates/secrets/index.html.erb') }
    let(:view)      { described_class.new(template, exposures) }
    let(:rendered)  { view.render }

    it 'exposes #secrets' do
        expect(view.secrets).to eq exposures.fetch(:secrets)
	end
	
	context 'when there are no secrets' do
		it 'shows a placeholder message' do
		  	expect(rendered).to include('No secrets stored yet.')
		end
	end

	context 'when there are secrets' do
		let(:secret1)     { Secret.new(login: 'Admin', secret: Encryptor.encrypt('secret1')) }
		let(:secret2)     { Secret.new(login: 'Superadmin', secret: Encryptor.encrypt('secret2')) }
		let(:exposures)   { Hash[secrets: [secret1, secret2]] }
	
		it 'lists them all' do
			expect(rendered.scan(/class="secret-item"/).length).to eq(2)
			expect(rendered).to include('Admin')
			expect(rendered).to include('secret1')
		end
	
		it 'hides the placeholder message' do
		  expect(rendered).to_not include('<p class="placeholder">No secrets stored yet.</p>')
    end
    
    it 'displays Delete button for secret' do
      expect(rendered).to include('<p class="placeholder">No secrets stored yet.</p>')
    end
	end
end
