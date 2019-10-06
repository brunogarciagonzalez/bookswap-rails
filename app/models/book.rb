class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books
  has_many :author_books
  has_many :authors, through: :author_books

  def serialize
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
    # TODO(bruno): UserBook column swapped(bool) & render active
      self.user_books.each do |ub|
        output[:user_books] << ub.serialize_for_book_serializer
      end
      return output
  end
end
