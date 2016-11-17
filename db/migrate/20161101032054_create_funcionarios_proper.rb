class CreateFuncionariosProper < ActiveRecord::Migration[5.0]
  def change
    create_table :funcionarios, {:id => false} do |t|
      t.primary_key :cpf
      t.string :nome
      t.integer :telefone
      t.text :endereco
      t.text :cargo
      t.text :horario
      t.text :sexo
      t.text :password_digest
      t.text :remember_digest

      t.timestamps
    end
  end
end
