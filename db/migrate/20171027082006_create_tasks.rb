class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :body
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
