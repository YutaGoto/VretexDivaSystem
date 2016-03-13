class Backend::SongsController < Backend::ApplicationController
  before_action :check_login

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save!
      redirect_to backend_song_path @song.id
    else
      render :new
    end
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(song_params)
      redirect_to backend_song_path @song.id
    else
      render :new
    end
  end

  def destloy
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(
      :title,
      :title_kana,
      :release_date,
      :composer_id,
      difficulty_ids: [],
      vocalist_ids: []
    )
  end
end
