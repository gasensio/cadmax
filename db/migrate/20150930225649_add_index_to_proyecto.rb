class AddIndexToProyecto < ActiveRecord::Migration
  def change
  	add_index :proyectos, :proyecto
  end
end
