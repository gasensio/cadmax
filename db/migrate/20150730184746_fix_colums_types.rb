class FixColumsTypes < ActiveRecord::Migration
  def change

  		change_column :posts, :horasof, :decimal
	   change_column :posts, :horasnf, :decimal
	   change_column :posts, :extra, :decimal
	   change_column :posts, :extraf, :decimal
	   change_column :posts, :nocturnas, :decimal
	   change_column :posts, :vacaciones, :decimal
	   change_column :posts, :bolsahg, :decimal
	   change_column :posts, :bolsahu, :decimal

  end
end
