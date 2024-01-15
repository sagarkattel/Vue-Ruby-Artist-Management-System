class MusicsController <ApplicationController
  # before_action :require_login
  before_action :authenticate_user
  before_action :set_music, only: [ :edit,:update, :destroy]
  before_action :set_artist_id, only: [:index, :new, :edit] 
  before_action :set_artist, only: [:edit, :update]

  def index
    @musics = Music.where(artist_id: @artist_id)
    render json: @musics
  end

  def show
    @artist_id = params[:artist_id]
    @music_id = params[:id]
    @musics = Music.where(artist_id: @artist_id,id:@music_id)
    render json: @musics
  end

  def new
    @music=Music.new
  end

  def create
    @music=Music.new(music_params)
    if @music.save
      render json: { message: "Music created successfully" }, status: :created
    else
      render json: { errors: @music.errors.full_messages }, status: :unprocessable_entity
  end
  end




  def edit
  end


  def update
    
    if @music.update(music_params)
      render json:"Music Updated Successfully", status: 200
    else
      render json: { errors: @artist.errors.full_messages }, status: :unprocessable_entity
  end
  end




  def destroy
    if @music.destroy
      render json:"Music Deleted Successsfully", status: 200
  else
      render json: { errors: @music.errors.full_messages }, status: :unprocessable_entity
  end
  end


  
  private

  def set_artist_id
    @artist_id = params[:artist_id]
  end

  def set_music
    @music = Music.find(params[:id])
  end 

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end  

  def music_params
    params.permit(:title, :album_name, :genre, :artist_id)
  end

end
