class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :image_url
      t.belongs_to :shelf, null: false, foreign_key: true

      t.timestamps
    end
  end
end
