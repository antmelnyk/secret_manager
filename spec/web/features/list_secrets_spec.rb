require 'features_helper'

RSpec.describe 'List secrets' do
    it 'displays secrets on the page' do
        visit '/secrets'

        within '#secrets' do
            expect(page).to have_css('.secret-item', count: 2)
        end
    end
end
