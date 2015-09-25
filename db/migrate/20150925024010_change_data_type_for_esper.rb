class ChangeDataTypeForEsper < ActiveRecord::Migration
  def change
		change_column :posts, :viaje, :decimal
	    change_column :posts, :espera, :decimal
  end
end
