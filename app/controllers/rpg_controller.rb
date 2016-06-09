class RpgController < ApplicationController
  def index
    if session[:gold].nil?
      session[:gold] = 0
    end
    if session[:messages].nil?
      session[:messages] = Array.new
    end
  end

  def cave
    @gold = rand(10..20)
    @act = ["You delved into the Cave and discovered #{@gold} gold!", "green"]
    session[:messages].push(@act)
    session[:gold] += @gold
    redirect_to '/'
  end

  def farm
    @gold = rand(5..10)
    @act = ["You worked on the Farm and earned #{@gold} gold!", "green"]
    session[:messages].push(@act)
    session[:gold] += @gold
    redirect_to '/'
  end

  def house
    @gold = rand(2..5)
    @act = ["You searched your House and found #{@gold} gold!", "green"]
    session[:messages].push(@act)
    session[:gold] += @gold
    redirect_to '/'
  end

  def casino
    @gold = rand(-50..50)
    if @gold >= 0
      session[:messages].push(["You visited the Casino and Earned #{@gold} gold!", "green"])
    else
      session[:messages].push(["You visited the Casino and Lost #{@gold} gold!", "red"])
    end
    session[:gold] += @gold
    redirect_to '/' 
  end

  def reset
    session[:gold] = nil
    session[:messages] = nil
    redirect_to '/'
  end

end
