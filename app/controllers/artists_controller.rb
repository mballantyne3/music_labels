class ArtistsController < ApplicationController
  def index
    @artists = Artist.where(actively_touring: true).all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to "/artists/#{artist.id}"
  end

  private
  def artist_params
    params.permit(:name, :member_count, :album_count, :actively_touring)
  end
end
