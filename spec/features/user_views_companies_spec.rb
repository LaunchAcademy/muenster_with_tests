require 'spec_helper'

feature 'user views companies' do

  it 'displays a list of companies' do
    launch = Company.create!(name: 'Launch Academy',
      location: 'Boston')
    metis = Company.create!(name: 'Metis',
      location: 'Boston')
    hack_reactor = Company.create!(name: 'Hack Reactor',
      location: 'San Fran')

    visit companies_path # => '/companies'

    expect(page).to have_content('Launch Academy')
    expect(page).to have_content('Metis')
    expect(page).to have_content('Hack Reactor')
  end

end
