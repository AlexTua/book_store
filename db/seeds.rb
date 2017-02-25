require 'ffaker'

Category.create(title: "Mobile development")
Category.create(title: "Photo")
Category.create(title: "Web design")
Category.create(title: "Web development")

Category.find_each do |category|
  16.times do |n|
    book = Book.create(category: category, title: FFaker::Book.title, price: rand(1..99), 
      quantity: rand(50..200))
    rand(1..3).times do |n|
      author = Author.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name)
      book.authors << author
    end
  end
end
