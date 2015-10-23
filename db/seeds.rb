##### Users 
User.destroy_all

10.times do |n|
  email      = "usuario#{n+1}@abc.net"
  first_name = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  User.create(
    email: email, password: '12345678', first_name: first_name, 
    last_name: last_name)
end

User.create(
  email: 'admin@abc.net', password: '12345678', first_name: "Admin", 
  last_name: '', admin: true)

##### Categories
Category.destroy_all

Category.create(name: 'Salud')
Category.create(name: 'Educación')
Category.create(name: 'Medio Ambiente')


##### Contents
status = ['authorized', 'unauthorized']

Content.destroy_all
20.times do |n|
  Content.create(
    title: Faker::Lorem.sentence(rand(2..10)).chomp('.'), 
    body: Faker::Lorem.paragraphs(rand(2..8)).join('\n'), 
    authorization_status: status.sample, #.sample: pick a random element 
    user_id: User.order("RANDOM()").first.id,
    category_id: Category.order("RANDOM()").first.id,
    created_at: rand(14.days).seconds.ago)
end
