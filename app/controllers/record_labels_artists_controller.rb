class RecordLabelsArtistsController < ApplicationController

  def index
    @record_label = RecordLabel.find(params[:id])
    @artists = @record_label.artists
  end
end
