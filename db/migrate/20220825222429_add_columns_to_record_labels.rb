class AddColumnsToRecordLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :record_labels, :genre_included, :boolean
    add_column :record_labels, :revenue, :bigint
    add_column :record_labels, :location, :string
  end
end
