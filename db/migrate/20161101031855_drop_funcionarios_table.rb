class DropFuncionariosTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :funcionarios
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
