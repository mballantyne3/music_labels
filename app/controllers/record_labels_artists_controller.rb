class RecordLabelsArtistsController < ApplicationController

  def index
    @record_label = RecordLabel.find(params[:id])
    @artists = @record_label.artists
    @artists = @artists.order(params[:sort]) if params[:sort].present?
  end

  def new
    @record_label = RecordLabel.find(params[:id])
  end

  def create
    @record_label = RecordLabel.find(params[:id])
    record_label_artist = @record_label.artists.create(artist_params)
    redirect_to "/record_labels/#{@record_label.id}/artists"
  end

  private

  def artist_params
    params.permit(:name, :member_count, :album_count, :actively_touring)
  end
end
