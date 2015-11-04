class CreateRecursos < ActiveRecord::Migration
  def change
    create_table :recursos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
