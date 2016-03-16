# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def get_pg_title_for_seed(link)
  open(link) do |f|
    doc = Nokogiri::HTML(f)
    doc.at_css('title').text
  end
end

User.create(name: "Nova",
            email: "nova@dominion.org",
            password: "foobar",
            password_confirmation: "foobar"
)

99.times.each do |i|
  name = Faker::Name.name
  email = "example_#{i}@abc.org"
  password="foobar"

  User.create(name: name,
              email: email,
              password: password,
              password_confirmation: password
  )
end

Topic.create(link: "https://www.google.com",
             description: 'a'*141,
             pageTitle: 'This is Nova!'*3,
             user_id: 1
)

99.times.each do |i|
  link = "https://news.ycombinator.com"

  Topic.create(
      link: link,
      description: "testing12#{i} lol" * 141,
      user_id: rand(99),
      pageTitle: "Whats crakin?"
  )
end

