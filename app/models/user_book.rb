class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def serialize
    # include data for book and for book's authors
      output = {
        user_id: self.user.id,
        condition: self.condition,
        description: self.description,
        book: {
          id: self.book.id,
          title: self.book.title,
          book_url: self.book.book_url,
          cover_url: self.book.cover_url,
          isbn_10: self.book.isbn_10,
          isbn_13: self.book.isbn_13,
          authors: []
        }
      }
      self.book.authors.each do |author|
        output[:book][:authors] << {name: author.name, open_library_id: author.open_library_id}
      end
      return output
  end
end
