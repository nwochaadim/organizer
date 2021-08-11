class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :notes
      t.datetime :starts_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
