class AddViajeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :viaje, :integer
  end
end
