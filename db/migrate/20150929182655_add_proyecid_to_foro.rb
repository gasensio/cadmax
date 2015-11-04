class AddProyecidToForo < ActiveRecord::Migration
  def change
    add_column :foros, :proyecto_id, :integer
  end
end
