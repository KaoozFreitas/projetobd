class AddPasswordDigestToFuncionarios < ActiveRecord::Migration[5.0]
  def change
    add_column :funcionarios, :password_digest, :string
  end
end
