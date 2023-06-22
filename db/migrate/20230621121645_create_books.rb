class CreateBooks < ActiveRecord::Migration[7.0]

  # Database Schema for Book table creation migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.integer :publication_year

      t.timestamps
    end
  end
end
