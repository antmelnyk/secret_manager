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
end
