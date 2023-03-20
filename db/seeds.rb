puts "Doing some magic ..."

20.times do
    title = Faker::Job.title 
    description = Faker::ChuckNorris.fact 
    Task.create(title: title, description: description)
end

5.times do
    email = Faker::Internet.email
    password = Faker::String.random(length: 6)
    User.create(email: email, password: password)
end

puts "Done seeding!!!"