class User < ApplicationRecord
  has_secure_password()

  has_many :user_books
  has_many :books, through: :user_books

  def id_and_username
    {
      id: id,
      username: username
    }
  end
end
