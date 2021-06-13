class Api::V1::BooksController < ApplicationController
    before_action :set_shelf

    def index
        @books = @account.books
        render json: @books
    end

    def create
        @book = Book.new(book_params)
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

    def set_shelf
        @shelf = Shelf.find(params[:shelf_id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :image_url, :shelf_id)
    end
end
