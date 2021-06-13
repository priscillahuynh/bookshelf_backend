class Api::V1::BooksController < ApplicationController

    def index
        @books = book_scope.all
        render json: @books
    end

    def create
        @book = book_scope.new(book_params)
        if @book.save
            render json: @book 
        else
            render json: {error: "Error creating Book"}
        end
    end

    def show 
        @book = Book.find(params[:id])
        render json: @book 
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
    end


    private 

    def book_scope
        if params[:shelf_id].present?
            @shelf = Shelf.find(params[:shelf_id])
            return @shelf.books
        else 
            return Book
        end
    end

    def book_params
        params.require(:book).permit(:title, :author, :image_url, :shelf_id)
    end
end
