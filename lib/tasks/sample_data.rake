namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(username: "matchy416",
                 email: "matchy416@gmail.com",
                 password: "n4desic0",
                 password_confirmation: "n4desic0")
    admin.toggle!(:admin)
    99.times do |n|
      username  = Faker::Internet.user_name
      email = Faker::Internet.email
      password  = "password"
      User.create!(username: username,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 10)
    20.times do 
      title = Faker::Lorem.sentence(1)
      description = Faker::Lorem.paragraphs(2)
      users.each do |user|
        user.items.create!(title: title, description: description)
      end
    end
  end
end