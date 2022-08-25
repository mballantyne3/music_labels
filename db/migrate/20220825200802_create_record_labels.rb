class CreateRecordLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :record_labels do |t|
      t.string :name
      t.timestamps
    end
  end
end
