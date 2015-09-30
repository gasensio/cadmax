class AddUseridToForo < ActiveRecord::Migration
  def change
    add_column :foros, :user_id, :integer
  end
end
