require 'spec_helper'

feature 'user views jobs' do

  it 'displays job titles' do
    company = Company.create!(name: 'Acme', location: 'Boston')
    job1 = Job.create!(title: 'foo', company: company)
    job2 = Job.create!(title: 'bar', company: company)

    visit '/jobs'

    expect(page).to have_content('foo')
    expect(page).to have_content('bar')
  end

end
