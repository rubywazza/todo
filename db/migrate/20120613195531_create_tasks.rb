class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :deadline
      t.boolean :is_finished
      t.string :attachment

      t.timestamps
    end
  end
end
