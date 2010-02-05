class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :bookmarklets do |t|
      t.string  :title,      :null => false
      t.text    :javascript, :null => false
      t.integer :author_id,  :null => false
      t.integer :parent_id,  :null => true

      t.timestamps
    end
    create_table :bookmarklet_usages do |t|
      t.integer :user_id,        :null => false
      t.integer :bookmarklet_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarklets
    drop_table :bookmarklet_usages
  end
end
