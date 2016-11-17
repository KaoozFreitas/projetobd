class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.0]
  def change
    change_column :funcionarios, :cpf, :string
  end
end
