class AddPaisToContactos < ActiveRecord::Migration
  def change
    add_column :contactos, :pais, :string
  end
end
