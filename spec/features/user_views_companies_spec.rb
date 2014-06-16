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

    expect(page).to have_link('Launch Academy', company_path(launch))
    expect(page).to have_link('Metis', company_path(metis))
    expect(page).to have_link('Hack Reactor', company_path(hack_reactor))
  end

  it 'displays the details for a single company' do
    launch = Company.create!(name: 'Launch Academy',
      description: 'blah', location: 'Boston')
    ee = Job.create!(title: 'Experience Engineer', company: launch)
    marketer = Job.create!(title: 'Marketer', company: launch)

    visit company_path(launch)

    expect(page).to have_content('Launch Academy')
    expect(page).to have_content('blah')

    expect(page).to have_link('Experience Engineer', job_path(ee))
    expect(page).to have_link('Marketer', job_path(marketer))

  end

end
