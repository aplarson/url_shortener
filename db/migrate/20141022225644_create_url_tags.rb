class CreateUrlTags < ActiveRecord::Migration
  def change
    create_table :url_tags do |t|
      t.integer :url_id
      t.integer :tag_id
    end
    
    add_index :url_tags, [:url_id, :tag_id], unique: true
    add_index :url_tags, :url_id
    add_index :url_tags, :tag_id
  end
end
