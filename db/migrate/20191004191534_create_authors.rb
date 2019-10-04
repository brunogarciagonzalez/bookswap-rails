class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :open_library_ID
      t.timestamps
    end
  end
end
