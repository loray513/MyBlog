class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string	:title,	null: false
    	t.string	:content, null: false
    	t.datetime	:deleted_at
      t.timestamps null: false
    end
  end
end
