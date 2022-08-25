class RecordLabelsController < ApplicationController
  def index
    @record_labels = RecordLabel.all
  end
end
