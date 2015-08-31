class Game

  attr_reader :coins

  def coins
    session[:coins] = 10
  end

  def score
    if (session[:reel1] == session[:reel2]) && (session[:reel1] == session[:reel3])
      puts "You have won 20 coins!"
      session[:coins]=session[:coins]+20
    elsif (session[:reel1] == session[:reel2])
      puts "You have won 10 coins!"
      ession[:coins]=session[:coins]+10
    else
      if session[:coins] == 0
        puts "No coins left. Sorry!"
      else
        puts "Not this time. Spin again."
      end
    end
  end
end