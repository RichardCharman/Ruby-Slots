class Game

  attr_reader :coins

  def coins
    session[:coins] = 10
  end

end