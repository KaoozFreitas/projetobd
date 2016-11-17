class CreateFuncionarios < ActiveRecord::Migration[5.0]
  def change
    create_table :funcionarios do |t|
      t.integer :cpf
      t.string :name
      t.integer :telefone
      t.text :endereco
      t.text :cargo
      t.text :horario
      t.text :sexo

      t.timestamps
    end
  end
end
