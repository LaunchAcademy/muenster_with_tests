require 'spec_helper'

feature 'user views jobs' do

  it 'displays list of jobs' do
    company = Company.create!(name: 'Acme', location: 'Boston')
    job1 = Job.create!(title: 'foo', company: company)
    job2 = Job.create!(title: 'bar', company: company)

    visit '/jobs'

    expect(page).to have_content('foo')
    expect(page).to have_content('bar')

    expect(page).to have_content('Acme')
    expect(page).to have_content('Boston')
  end

end
