class ArtistsController < ApplicationController
    # before_action :require_login
    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    def show
    end
    def index
        @artist=Artist.all
        render json: @artist, status: 201
    end

    def new
        @artist=Artist.new
    end
    
    def create
        @artist=Artist.new(artist_params)
        if @artist.save
            render json: { message: "Artist created successfully" }, status: :created
          else
            render json: { errors: @artist.errors.full_messages }, status: :unprocessable_entity
        end
    end    
    
    def edit

    end

    def update
        if @artist.update(artist_params)
            render json:"Artist Updated Successfully", status: 200
          else
            render json: { errors: @artist.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def destroy
        @music=Music.where(artist_id: @artist.id)
        @music.destroy_all
        if @artist.destroy
            render json:"Deleted Successsfully", status: 200
        else
            render json: { errors: @artist.errors.full_messages }, status: :unprocessable_entity
        end

    end    

    private

    def set_artist
        @artist=Artist.find(params[:id])
    end    

    def artist_params
        params.require(:artist).permit(:name,:dob,:gender, :address, :first_release_year,:no_of_albums_released)
    end   
    
    

end