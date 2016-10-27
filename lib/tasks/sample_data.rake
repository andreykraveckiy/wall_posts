namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_posts
    make_comments
    make_comments_of_comments
  end
end

def make_users
  9.times do |n|
    name = Faker::Name.name
    encrypted_password = User.new(:password => "password8").encrypted_password
    uid = ('0'..'1').to_a.shuffle[0..7].join
    email = Faker::Internet.email
    User.create!(name: name,
                 encrypted_password: encrypted_password,
                 provider: "vkontakte",
                 uid: uid,
                 email: email,
                 password: "password8")
  end
end

def make_posts
  users = User.all(limit: 4)
  2.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.posts.create!(content: content) }
  end
end

def make_comments
  posts = Post.all(limit: 3)
  3.times do
    user = User.find(Random.new.rand(1..9))
    content = Faker::Lorem.sentence(4)
    posts.each { |post| post.comments.create!(content: content, user: user) }
  end
end

def make_comments_of_comments
  comments = Comment.all(limit: 4)
  3.times do
    user = User.find(Random.new.rand(1..9))
    content = Faker::Lorem.sentence(4)
    comments.each { |comment| comment.comments.create!(content: content, user: user) }
  end
end