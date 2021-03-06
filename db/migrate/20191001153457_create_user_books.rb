class CreateUserBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :condition
      t.text :description
      t.boolean :active
      t.timestamps
    end
  end
end
