class FuncionariosController < ApplicationController

  def index
    @funcionarios = Funcionario.all
  end

  def show
    @funcionario = Funcionario.find(params[:id])
  end

  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    if @funcionario.save
      log_in @funcionario
      flash[:success] = "Logado com sucesso."
      redirect_to @funcionario
    else
      render 'new'
    end
  end

  def edit
    @funcionario = Funcionario.find(params[:id])
  end


  def update
    @funcionario = Funcionario.find(params[:id])
    if @funcionario.update_attributes(funcionario_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  private
    def funcionario_params
      params.require(:funcionario).permit(:cpf, :nome, :password, :telefone, :endereco, :cargo, :horario, :sexo,
                                   :password_confirmation)
    end
end
