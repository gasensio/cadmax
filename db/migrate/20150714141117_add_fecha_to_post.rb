class AddFechaToPost < ActiveRecord::Migration
  def change
    add_column :posts, :fecha, :datetime
  end
end
