class AddColoniaToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :colonia, :string
  end
end
