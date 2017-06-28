class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.column :artist_name, :string
      t.column :content, :string
      t.column :rating, :integer

      t.timestamps
    end
  end
end
