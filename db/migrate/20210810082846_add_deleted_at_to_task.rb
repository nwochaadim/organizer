class AddDeletedAtToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :deleted_at, :datetime
    add_index :tasks, :deleted_at
  end
end
