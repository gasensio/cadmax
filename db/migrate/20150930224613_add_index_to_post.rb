class AddIndexToPost < ActiveRecord::Migration
  def change
  	add_index :posts, :alta
  	add_index :posts, :user_id
  	add_index :posts, :proyecto
  end
end
