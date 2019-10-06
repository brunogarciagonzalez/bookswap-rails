class BooksController < ApplicationController

    def index
        render json: Book.all.map { |book| book.serialize(only_active_user_books: false) }
    end

    def actives_only
        # via this action:
        # user can see all books that have active UserBooks (serialized)
        render json: Book.only_books_with_active_user_books # is serializer too
    end
end
