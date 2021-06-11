class Api::V1::ShelvesController < ApplicationController
    def index
        @shelves = Shelf.all
        render json: @shelves
    end

    def create
        @shelf = Shelf.new(shelf_params)
        if @shelf.save
            render json: @shelf
        else 
            render json: {error: "Error creating shelf"}
        end
    end

    def show
        @shelf = Shelf.find(params[:id])
        render json: @shelf
    end

    def destroy
        @shelf = Shelf.find(params[:id])
        @shelf.destroy
    end

    private

    def shelf_params
        params.require(:shelf).permit(:name)
    end
end
