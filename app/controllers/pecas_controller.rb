class PecasController < ApplicationController
  def index
    @pecas = Peca.all
  end

  def show
    @peca = Peca.find(params[:id])
  end

  def new
    @peca = Peca.new
  end

  def create
    @peca = Peca.new(peca_params)
    if @peca.save
      flash[:success] = "Peça Cadastrada"
      redirect_to @peca
    else
      render 'new'
    end
  end

  private
    def peca_params
      params.require(:peca).permit(:codigo, :nome, :medida, :tipo, :quantidade, :modeloMotor)
    end
end
