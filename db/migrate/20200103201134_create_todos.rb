class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :todo
      t.boolean :completed

      t.timestamps
    end
  end
end
