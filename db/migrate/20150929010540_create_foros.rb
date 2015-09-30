class CreateForos < ActiveRecord::Migration
  def change
    create_table :foros do |t|
      t.string :titulo
      t.text :contenido

      t.timestamps null: false
    end
  end
end
