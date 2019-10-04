class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn_10
      t.string :isbn_13
      t.string :book_url
      t.string :cover_url
      t.timestamps
    end
  end
end
