module SessionsHelper
  # Logs in the given funcionario.
  def log_in(funcionario)
    session[:funcionario_id] = funcionario.cpf
  end

  # Remembers a funcionario in a persistent session.
  def remember(funcionario)
    funcionario.remember
    cookies.permanent.signed[:funcionario_id] = funcionario.cpf
    cookies.permanent[:remember_token] = funcionario.remember_token
  end

  # Returns the current logged-in funcionario (if any).
  def current_funcionario
    if (funcionario_id = session[:funcionario_id])
      @current_funcionario ||= Funcionario.find_by(cpf: funcionario_id)
    elsif (funcionario_id = cookies.signed[:funcionario_id])
      funcionario = Funcionario.find_by(cpf: funcionario_id)
      if funcionario && funcionario.authenticated?(cookies[:remember_token])
        log_in funcionario
        @current_funcionario = funcionario
      end
    end
  end

  # Returns true if the funcionario is logged in, false otherwise.
  def logged_in?
    !current_funcionario.nil?
  end

  # Forgets a persistent session.
  def forget(funcionario)
    funcionario.forget
    cookies.delete(:funcionario_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current funcionario.
  def log_out
    forget(current_funcionario)
    session.delete(:funcionario_id)
    @current_funcionario = nil
  end
end
