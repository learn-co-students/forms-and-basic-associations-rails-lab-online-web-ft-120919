class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    2.times { @song.notes.build }
  end

  def create
    @song = Song.new(song_params)
    @song.artist_name=(params[:song][:artist_name])
    @song.notes = []
    params[:song][:notes_attributes].each_value do |value|
      @song.notes << Note.create(song_id: @song.id, content: value[:content])
    end

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :genre_id)
  end
end