class UserBooksController < ApplicationController
    before_action :authorized

    def create
        # find or create book
            # step 1: find by isbn
        isbn_10 = params["bookData"]["identifiers"]["ISBN-10"]
        isbn_13 = params["bookData"]["identifiers"]["ISBN-13"]
        book = Book.find_by(isbn_10: isbn_10) || Book.find_by(isbn_13: isbn_13)
            # step 2: if not found, create book
            # also need to create the author(s) and AuthorBook joins
        if !book
            title = params["bookData"]["title"]
            book_url = params["bookData"]["bookUrl"]
            cover_url = params["bookData"]["coverUrl"]
            book = Book.create(isbn_10: isbn_10, isbn_13: isbn_13, title: title, book_url: book_url, cover_url: cover_url)

            params["bookData"]["authors"].each do |author_hash|
                author = Author.find_or_create_by(open_library_id: author_hash["openLibraryID"], name: author_hash["name"])
                book.authors << author
            end
        end
        # create UserBook   
        condition = params["condition"] 
        description = params["description"] 
        user_book = UserBook.create(user: current_user, book: book, condition: condition, description: description)
        
        render json: { success: true, user_book: user_book.serialize }
    end
    
    def destroy
        byebug
    end
end
