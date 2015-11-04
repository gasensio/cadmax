class AddIndexToCliente < ActiveRecord::Migration
  def change
  	add_index :clientes, :name
  end
end
