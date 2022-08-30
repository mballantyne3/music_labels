class SwapGenreIncludedForEmployeeOwned < ActiveRecord::Migration[5.2]
  def up
    remove_column :record_labels, :genre_included
    add_column :record_labels, :employee_owned, :boolean
  end

  def down
    remove_column :record_labels, :employee_owned
    add_column :record_labels, :genre_included, :boolean
  end
end
