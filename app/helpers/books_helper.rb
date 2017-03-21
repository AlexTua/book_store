module BooksHelper
  def book_authors(book)
    book.authors.map { |author| "#{author.first_name} #{author.last_name}" } 
    .join(', ')
  end

  def book_description(book)
    truncate(book.description, length: 350) {link_to "Read More", "#", class: "in-gold-500 ml-10", id: "read_link"}
  end

  def book_dimensions(book)
    "H: #{book.dimensions['H']}” x W: #{book.dimensions['W']}” x D: #{book.dimensions['D']}”"
  end
end
