class ChangeColumnNameToNome < ActiveRecord::Migration[5.0]
  def change
    rename_column :funcionarios, :name, :nome
  end
end

