# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# begin user accounts definition
user_list = [
  ['John', 'Doe', 'john.doe@example.com', 'password'],
  ['Christopher', 'Turner', 'hristopher.turner@example.com', 'password'],
  ['Brandon', 'Kelly', 'brandon.kelly@example.com', 'password'],
  ['Jessica', 'Lambert', 'jessica.lambert@example.com', 'password'],
  ['Simon', 'Lawrence', 'simon.lawrence@example.com', 'password']
]

user_list.each do |firstname, lastname, email, password|
  User.create! firstname: firstname, lastname: lastname, email: email, password: password, password_confirmation: password
end

  # ******* admin definition
admin = User.create! firstname: 'Admin', lastname: 'Adminlastname', email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true
# end user accounts definition

# begin category definition
sport = Category.create! name: 'sport'
# end category definition

# begin products definition
product_list = [
  ['soccer ball', 'some description', '50', sport, User.find(1)],
  ['ball for voleyball', 'some description', '50', sport, User.find(1)],
  ['tennis ball', 'some description', '15', sport, User.find(1)],

  ['tennis racket', 'some description', '100', sport, User.find(2)],
  ['skis', 'some description', '200', sport, User.find(2)],
  
  ['ski helmet', 'some description', '50', sport, User.find(3)],
  ['bicycle helmet', 'some description', '40', sport, User.find(3)],

  ['bike', 'some description', '500', sport, User.find(4)],
  ['roll', 'some description', '200', sport, User.find(4)],

  ['mountain bike', 'some description', '700', sport, User.find(5)],
  ['running shoes', 'some description', '100', sport, User.find(5)],

  ['ball for basketball', 'some description', '80', sport, User.find(6)],
  ['dumbbell', 'some description', '200', sport, User.find(6)]
]

product_list.each do |title, description, price, category, user|
  Product.create! title: title, description: description, price: price, category: category, user: user
end
# end products definition

# begin reviews definition
review_list = [
  ['some review1', '5', Product.find(1), User.find(1)],
  ['some review2', '4', Product.find(2), User.find(1)],
  ['some review3', '3', Product.find(3), User.find(1)],
  ['some review4', '2', Product.find(4), User.find(1)],
  ['some review5', '1', Product.find(5), User.find(1)],
  ['some review6', '2', Product.find(6), User.find(1)],

  ['some review7', '3', Product.find(5), User.find(2)],
  ['some review8', '4', Product.find(6), User.find(2)],
  ['some review9', '5', Product.find(7), User.find(2)],
  ['some review10', '4', Product.find(8), User.find(2)],
  ['some review11', '3', Product.find(9), User.find(2)],
  ['some review12', '2', Product.find(10), User.find(2)],

  ['some review13', '1', Product.find(11), User.find(3)],
  ['some review14', '2', Product.find(12), User.find(3)],
  ['some review15', '3', Product.find(13), User.find(3)],
  ['some review16', '4', Product.find(1), User.find(3)],
  ['some review17', '5', Product.find(2), User.find(3)],
  ['some review18', '4', Product.find(3), User.find(3)],

  ['some review19', '5', Product.find(4), User.find(4)],
  ['some review20', '2', Product.find(5), User.find(4)],
  ['some review21', '3', Product.find(6), User.find(4)],
  ['some review22', '4', Product.find(7), User.find(4)],
  ['some review23', '5', Product.find(8), User.find(4)],
  ['some review24', '4', Product.find(9), User.find(4)],

  ['some review25', '5', Product.find(10), User.find(5)],
  ['some review26', '2', Product.find(11), User.find(5)],
  ['some review27', '3', Product.find(12), User.find(5)],
  ['some review28', '4', Product.find(13), User.find(5)],
  ['some review29', '5', Product.find(1), User.find(5)],
  ['some review30', '4', Product.find(2), User.find(5)],

  ['some review31', '5', Product.find(3), User.find(6)],
  ['some review32', '2', Product.find(4), User.find(6)],
  ['some review33', '3', Product.find(5), User.find(6)],
  ['some review34', '4', Product.find(6), User.find(6)],
  ['some review35', '5', Product.find(7), User.find(6)],
  ['some review36', '4', Product.find(8), User.find(6)]
]

review_list.each do |content, rating, product, user|
  Review.create! content: content, rating: rating, product: product, user: user
end
# end reviews definition
