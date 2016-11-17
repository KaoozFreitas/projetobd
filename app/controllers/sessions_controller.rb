class SessionsController < ApplicationController
  def new
  end

  def create
    funcionario = Funcionario.find_by(cpf: params[:session][:cpf])
    if funcionario && funcionario.authenticate(params[:session][:password])
      log_in funcionario
      params[:session][:remember_me] == '1' ? remember(funcionario) : forget(funcionario)
      redirect_to funcionario
    else
      flash.now[:danger] = 'CPF/Senha inválidos'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
