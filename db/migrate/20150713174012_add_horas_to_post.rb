class AddHorasToPost < ActiveRecord::Migration
  def change
    add_column :posts, :pedido, :string
    add_column :posts, :horasof, :integer
    add_column :posts, :horasnf, :integer
    add_column :posts, :extra, :integer
    add_column :posts, :extraf, :integer
    add_column :posts, :nocturnas, :integer
    add_column :posts, :vacaciones, :integer
    add_column :posts, :bolsahg, :integer
    add_column :posts, :bolsahu, :integer
  end
end
