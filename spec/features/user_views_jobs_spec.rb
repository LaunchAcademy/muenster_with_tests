require 'spec_helper'

feature 'user views jobs' do

  it 'displays list of jobs' do
    company = Company.create!(name: 'Acme', location: 'Boston')
    job1 = Job.create!(title: 'foo', company: company)
    job2 = Job.create!(title: 'bar', company: company)

    visit '/jobs'

    expect(page).to have_link('foo', job_path(job1))
    expect(page).to have_link('bar', job_path(job2))

    expect(page).to have_content('Acme')
    expect(page).to have_content('Boston')
  end

  it 'orders the jobs by time last updated' do
    company = Company.create!(name: 'Acme', location: 'Boston')
    newer_job = Job.create!(title: 'foo', company: company,
      updated_at: 4.days.ago)

    older_job = Job.create!(title: 'bar', company: company,
      updated_at: 3.days.ago)

    visit '/jobs'

    foo_index = page.body.index('foo')
    bar_index = page.body.index('bar')

    expect(foo_index > bar_index).to eq(true)
  end

  it 'views details for a job' do
    company = Company.create!(name: 'Acme', location: 'Boston')
    job = Job.create!(title: 'foo', company: company,
      description: "blah")

    visit job_path(job) # => "/jobs/#{job.id}"

    expect(page).to have_content('foo')
    expect(page).to have_content('blah')
    expect(page).to have_content('Acme')
    expect(page).to have_content('Boston')
  end

end
