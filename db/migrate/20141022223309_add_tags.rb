class AddTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
    end
    
    add_index :tags, :tag, unique: true
  end
end
