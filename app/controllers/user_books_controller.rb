class UserBooksController < ApplicationController
    before_action :authorized

    def create
        byebug
        
        # find or create book
        # step 1: find by isbn
        isbn_10 = params["bookData"]["identifiers"]["ISBN-10"]
        isbn_13 = params["bookData"]["identifiers"]["ISBN-13"]
        book = Book.find_by(isbn_10: isbn_10) || Book.find_by(isbn_13: isbn_13)

        # step 2: if not found, create book
        # also need to create the author(s) and AuthorBook joins
        if !book
            params["bookData"]["title"]
            params["bookData"]["bookUrl"]
            params["bookData"]["coverUrl"]
            params["bookData"]["authors"]
            
            # also need to create the author(s) and AuthorBook joins
        end


        # create UserBook
        
        # need user 
        current_user
        # activerecord serializer??
    end
    
    def destroy
        byebug
    end
end
