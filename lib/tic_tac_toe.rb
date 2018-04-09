# START OF TIC TAC TOE GAME

def player_won(player)

  if ["A1", "A2", "A3"].index{|x| !player.getSquares.include?(x)}.nil?
    return true
  elsif ["B1", "B2", "B3"].index{|x| !player.getSquares.include?(x)}.nil?
    return true
  elsif ["C1", "C2", "C3"].index{|x| !player.getSquares.include?(x)}.nil?
    return true
  elsif ["A1", "B1", "C1"].index{|x| !player.getSquares.include?(x)}.nil?
    return true
  elsif ["A2", "B2", "C2"].index{|x| !player.getSquares.include?(x)}.nil?
    return true
  elsif ["A3", "B3", "C3"].index{|x| !player.getSquares.include?(x)}.nil?
    return true
  elsif ["A1", "B2", "C3"].index{|x| !player.getSquares.include?(x)}.nil?
    return true
  elsif ["A3", "B2", "C1"].index{|x| !player.getSquares.include?(x)}.nil?
    return true
  else
    return false
  end

end #player_won

def play_game(player1, player2, b)

  puts "Game starting........... (type q to quit)"
  user_input = ''
  turn = 0

  while true

    unless (user_input === 'q' ||  turn > 4)
      turn += 1
      puts "#{player1.getName}'s move. Where do you put O?"
      user_input = gets.chomp
      player1.add_square(user_input)
      b.add_square(user_input, "O")
      puts "#{player1.getName}'s squares: #{player1.getSquares}"
      if player_won(player1)
        puts "#{player1.getName} won!"
        break
      else
        puts "#{player2.getName}'s move. Where do you put X?"
        user_input = gets.chomp
        player2.add_square(user_input)
        b.add_square(user_input, "X")
        puts "#{player2.getName}'s squares: #{player2.getSquares}"
        if player_won(player2)
          puts "#{player2.getName} won!"
          break
        end
      end

    else
      puts "No one won!"
      puts "quiting..........."
      break
    end

  end # while

end # play_game

def start_game

  puts "Do you want to play tic-tac-toe? (y/n)"

  choice = gets.chomp.downcase

  unless ["y","n"].include?(choice)
    abort("Please answer with y or n.")
  end

  case choice
  when "y"
    puts "Ok, let's start!"
    b = Board.new
    puts "Enter name of player 1 (O)"
    player1name = gets.chomp
    player1 = Player.new(player1name)
    puts "Now enter name of player 2 (X)"
    player2name = gets.chomp
    player2 = Player.new(player2name)
    play_game(player1, player2, b)
  when "n"
    puts "Your loss."
  end

end #start_game


class Board

  attr_accessor :board

  def initialize

    keys = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]

    @board = Hash[keys.product]

  end # def initialize

  def add_square(key, player)

    @board[key] = player

  end


end # class Board



class Player

  attr_accessor :name, :squares

  def initialize(name)
    @name = name
    @squares = []
  end

  def getName
    @name
  end

  def add_square(value)
    @squares.push(value)
  end

  def getSquares
    @squares
  end

end # class player



# HERE IS WHERE THE MAIN PROGRAM STARTS. IT FIRST CALLS START_GAME WHICH IN TURN CALLS PLAY_GAME

start_game


