class BooksController < ApplicationController

    def index
        # via this action:
        # user can see all books that have UserBooks
        # this assumes that all books that sieze to have UserBooks will be deleted
        # this will likely have to change since the user could be able to see past swaps, etc.
        # TODO(bruno): UserBook column swapped(bool) & render active
        render json: Book.all.map { |book| book.serialize }
    end
end
