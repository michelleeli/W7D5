class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.references :sub , foreign_key: true, null: false
      t.references :author, foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
