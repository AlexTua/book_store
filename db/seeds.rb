require 'ffaker'

Category.create(title: "Mobile development")
Category.create(title: "Photo")
Category.create(title: "Web design")
Category.create(title: "Web development")

Category.find_each do |category|
  5.times do |n|
    author = Author.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name)
    book = Book.create(category: category, title: FFaker::Book.title, price: rand(1..99), 
      quantity: rand(50..200))
    book.authors << author
  end
end
