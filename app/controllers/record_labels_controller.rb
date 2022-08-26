class RecordLabelsController < ApplicationController
  def index
    @record_labels = RecordLabel.all
  end

  def show
    @record_label = RecordLabel.find(params[:id])
  end
end
