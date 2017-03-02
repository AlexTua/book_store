module BooksHelper
  def book_authors(book)
    authors = []
    book.authors.each do |author| 
      authors << "#{author.first_name} #{author.last_name}" 
    end
    authors.join(', ')
  end

  def price_in_currency(book)
    number_to_currency(book.price, unit: '€')
  end

  def book_description(book)
    truncate(book.description, length: 350) {link_to "Read More", "#", class: "in-gold-500 ml-10", id: "read_link"}
  end
end
