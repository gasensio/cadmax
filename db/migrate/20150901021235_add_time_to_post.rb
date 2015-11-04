class AddTimeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :inicio, :time
    add_column :posts, :fin, :time
  end
end
