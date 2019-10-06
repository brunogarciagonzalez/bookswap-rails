class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books
  has_many :author_books
  has_many :authors, through: :author_books

  def self.books_with_actives_only  
    # good ol each with if statements
    output = []
    self.all.each do |book|
      serialized_book = book.serialize(active: true)
      if serialized_book.user_books.length > 0
        output << serialized
      end
    end
  end

  def serialize(options={})
    output = {
      id: self.id,
      title: self.title,
      book_url: self.book_url,
      cover_url: self.cover_url,
      isbn_10: self.isbn_10,
      isbn_13: self.isbn_13,
      authors: [],
      user_books: []
    }
    self.authors.each do |author|
      output[:authors] << {name: author.name, open_library_id: author.open_library_id}
    end
    # if options[:active]
    # only include active UserBooks
    if options[:active] 
      self.user_books.each do |ub|
        if ub.active
          output[:user_books] << ub.serialize_for_book_serializer
        end
      end
    else
      self.user_books.each do |ub|
        output[:user_books] << ub.serialize_for_book_serializer
      end
    end
    return output
  end
end
