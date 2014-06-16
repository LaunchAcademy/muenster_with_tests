require 'spec_helper'

feature 'user creates company' do

  it 'creates a new company' do
    visit new_company_path

    fill_in 'Name', with: 'Launch Academy'
    fill_in 'Location', with: 'Boston'

    click_button 'Create Company'

    expect(page).to have_content('Launch Academy')
    expect(Company.count).to eq(1)

  end
end
