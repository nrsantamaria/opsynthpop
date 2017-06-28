Post.destroy_all

20.times do |index|
  Post.create!(artist_name: Faker::StarWars.vehicle,
              content: Faker::StarWars.wookie_sentence,
              rating: Faker::Number.between(1, 100))
end

p "Created #{Post.count} posts"
