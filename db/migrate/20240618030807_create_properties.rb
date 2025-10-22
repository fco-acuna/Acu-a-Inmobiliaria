class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.references :account
      t.string :dirección
      t.string :colonia
      t.integer :cuartos
      t.integer :baños
      t.string :extras
      t.integer :precio
      t.string :photo

      t.timestamps
    end
  end
end
