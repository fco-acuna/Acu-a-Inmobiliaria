class RenameDireccionAndBanosInProperties < ActiveRecord::Migration[7.1]
  def change
    rename_column :properties, :dirección, :direccion
    rename_column :properties, :baños, :banos
  end
end
