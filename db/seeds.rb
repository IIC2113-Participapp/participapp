puts 'Creating categories...'
num_categories = 3
Category.create!(name: 'Salud')
Category.create!(name: 'Educación')
Category.create!(name: 'Medio Ambiente')

puts 'Creating admin...'
User.create!(email: 'admin@abc.net', password: 'napoleon', first_name: 'John',
            last_name: 'Admin', admin: true, editor: true)

puts 'Creating editor...'
User.create!(email: 'editor@abc.net', password: 'napoleon', first_name: 'John',
            last_name: 'Editor', admin: false, editor: true)

puts 'Creating users...'
20.times do |n|
  email      = "user#{n+1}@abc.net"
  first_name = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  user = User.create!(email: email, password: 'macoy123', first_name: first_name,
                     last_name: last_name, periodicity: [1, 2, 5, 7, 10, 14].sample,
                     last_received: rand(14.days).seconds.ago)

  num_related_categories = rand(1..num_categories)
  num_related_categories.times do |i|
    category = Category.all.sample
    user.categories << Category.all.sample unless user.categories.include?(category)
  end
end

puts 'Creating contents...'

num_contents = 50
status = ['authorized', 'pending']

num_contents.times do |n|
  Content.create!(title: Faker::Lorem.sentence(rand(2..10)).chomp('.'),
                  body: Faker::Lorem.paragraphs(rand(2..8)).join('\n'),
                  authorization_status: status.sample,
                  user_id: User.order("RANDOM()").first.id,
                  category_id: Category.order("RANDOM()").first.id,
                  created_at: rand(14.days).seconds.ago)
end
