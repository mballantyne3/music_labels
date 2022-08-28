class RecordLabelsArtistsController < ApplicationController

  def index
    @record_label = RecordLabel.find(params[:id])
    @artists = @record_label.artists
  end

  def new
    @record_label = RecordLabel.find(params[:id])
  end

  def create
    record_label_artist = RecordLabelsArtist.create()
  end
end
