User.delete_all
Post.delete_all
Comment.delete_all

user1 = User.create!( first_name: Faker::Name.name, last_name: Faker::Name.name )
user2 = User.create!( first_name: Faker::Name.name, last_name: Faker::Name.name )
user3 = User.create!( first_name: Faker::Name.name, last_name: Faker::Name.name )

post1 = Post.create!(
title: Faker::Lorem.sentence,
body: Faker::Lorem.paragraphs.join("\n\n"),
user: user1
)

post2 = Post.create!(
title: Faker::Lorem.sentence,
body: Faker::Lorem.paragraphs.join("\n\n"),
user: user1
)

post3 = Post.create!(
title: Faker::Lorem.sentence,
body: Faker::Lorem.paragraphs.join("\n\n"),
user: user2
)

Comment.create!(
user: user3,
post: post1,
body: Faker::Lorem.paragraph
)

Comment.create!(
user: user2,
post: post1,
body: Faker::Lorem.paragraph
)

Comment.create!(
user: user1,
post: post3,
body: Faker::Lorem.paragraph
)
