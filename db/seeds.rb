companies = [
  {
    name: 'Five Guys Burgers & Soggy Chunks of Potato',
    location: 'Boston, MA',
    industry: 'grease',
    jobs: [
      { title: 'Burger Flipper', description: 'Nuff said.' }
    ]
  },

  {
    name: 'Petco',
    location: 'Cambridge, MA',
    description: "It's where the pets go. Even Mr. G.",
    industry: 'furballs',
    jobs: [
      { title: 'Dragon Tamer', description: 'Must be able to keep your cool when things get hot.' },
      { title: 'Personal Assistant',
        description: 'Full-time employment to cater to the every need of a certain British Shorthair cat.' }]
  },

  {
    name: "Sloppy Lydia's Pub & Grub",
    location: 'Boston, MA',
    description: 'Happy hour every hour.',
    industry: 'sloppiness',
    jobs: [
      { title: 'Bartender', description: 'Apply only if you know how to pour things into other things.' }
    ]
  },

  {
    name: 'Launch Academy',
    location: 'Boston, MA',
    description: 'Learn how to pilot a spacecraft in 10 weeks!',
    industry: 'spaceeeee',
    jobs: [
      { title: 'Wizard', description: 'Must be knowledgable in all of the black arts to fight space dragons.' },
      { title: 'Barista', description: 'Job responsibilities include churning out black sludge, making loud noises, and being a robot.' },
      { title: 'Jr. Astronaut', description: 'Must like space.' },
      { title: 'Sr. Astronaut', description: 'Must REALLY like space. Or have starred in Apollo 13 (the movie, not the actual space mission).' }
    ]
  },

  {
    name: 'Ross Inc.',
    location: 'Marshfield, MA',
    description: 'Bieber Bieber Bieber.',
    industry: 'stalking',
    jobs: [
      { title: 'Bieber Stalker', description: 'Do you know where Justin Bieber lives? DO YUO???' }
    ]
  }
]


companies.each do |company_hash|
  company_attr = {
    name: company_hash[:name],
    location: company_hash[:location],
    description: company_hash[:description],
    industry: company_hash[:industry]
  }

  company = Company.find_by(company_attr)
  company ||= Company.create!(company_attr)

  company_hash[:jobs].each do |job_hash|
    job_attr = {
      title: job_hash[:title],
      description: job_hash[:description],
      company: company
    }

    if !Job.exists?(job_attr)
      Job.create!(job_attr)
    end
  end
end
