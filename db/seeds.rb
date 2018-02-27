# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users Generation
for i in 1..50
  #  name       :string
  #  email      :string
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  email = Faker::Internet.safe_email(name)

  user = User.new
  user.email = email
  user.name = name

  #Save user, not tied to anything
  if user.save
    p user.name
  end


  # Article generation
  #  title      :text
  #  content    :text
  #  user_id    :integer
  article = Article.new
  article.title = Faker::Lorem.sentence
  article.content = Faker::Lorem.paragraph
  article.user_id = user.id

  if article.save
    p article.title
  end


end

for user in User.all
  for article in Article.all
    for i in 1..10
      #  message    :text
      #  user_id    :integer
      #  article_id :integer
      comment = Comment.new
      comment.message = Faker::Lorem.paragraph
      comment.user_id = user.id
      comment.article_id = article.id

      comment.save
    end
  end
  p "Created 10 comments on each article by user #{user.name}"
end

