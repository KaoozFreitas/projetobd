class AddRememberDigestToFuncionarios < ActiveRecord::Migration[5.0]
  def change
    add_column :funcionarios, :remember_digest, :string
  end
end
