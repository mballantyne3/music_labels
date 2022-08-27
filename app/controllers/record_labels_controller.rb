class RecordLabelsController < ApplicationController
  def index
    @record_labels = RecordLabel.order("created_at").all
  end

  def show
    @record_label = RecordLabel.find(params[:id])
  end
end
