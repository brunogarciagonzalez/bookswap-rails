class BooksController < ApplicationController

    def index
        render json: Book.all.map { |book| book.serialize(active: false) }
    end

    def actives_only
        # via this action:
        # user can see all books that have active UserBooks
        render json: Book.all.map { |book| book.serialize(active: true) }
    end
end
