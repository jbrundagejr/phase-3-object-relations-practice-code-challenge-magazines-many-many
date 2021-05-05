puts "Clearing old data..."
Magazine.destroy_all
Reader.destroy_all
Subscription.destroy_all

puts "Seeding magazines..."
magazines = ["The New Yorker", "National Geographic", "Wired", "People", "Cosmopolitan", "Time", "US Weekly", "New York Magazine"]
# Create sample magazines
magazines.each do |magazine|
  Magazine.create(title: magazine)
end

puts "Seeding readers..."
# Create 10 random Readers
10.times do
  Reader.create(name: Faker::Name.name, email: Faker::Internet.email)
end

puts "Seeding subscriptions..."
# Create 20 random subscriptions
20.times do

  Subscription.create(magazine_id: Magazine.ids.sample,
                      reader_id: Reader.ids.sample,
                      price: rand(10...100))
end

puts "Done!"