class RecordLabelsController < ApplicationController
  def index
    @record_labels = RecordLabel.order("created_at").all
  end

  def show
    @record_label = RecordLabel.find(params[:id])
    @artist_count = @record_label.artists.count
  end

  def new
  end

  def create
    record_label = RecordLabel.create(record_label_params)
    redirect_to "/record_labels"
  end

  def record_label_params
    params.permit(:name, :revenue, :location)
  end
end
