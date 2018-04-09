require 'tic_tac_toe'

describe 'Game' do


  describe 'start_game' do

    let(:output) {double('output').as_null_object}
    let(:game){start_game(output)}

    context 'user starts game' do
      it "should print 'Do you want to play tic-tac-toe? (y/n)'" do
        output.should_receive(:puts).with('Do you want to play tic-tac-toe? (y/n)')
        start_game
      end
    end
  end


end

