class AddRecursoToPost < ActiveRecord::Migration
  def change
    add_column :posts, :recurso, :string
  end
end
