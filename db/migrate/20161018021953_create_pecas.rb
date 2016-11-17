class CreatePecas < ActiveRecord::Migration[5.0]
  def change
    create_table :pecas, {:id => false} do |t|
      t.primary_key :codigo
      t.string :nome
      t.float :medida
      t.string :tipo
      t.integer :quantidade
      t.string :modeloMotor

      t.timestamps
    end
  end
end
