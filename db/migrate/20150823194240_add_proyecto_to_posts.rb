class AddProyectoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :proyecto, :string
  end
end
