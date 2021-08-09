class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :notes
      t.references :user, null: false, foreign_key: true
      t.datetime :starts_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
