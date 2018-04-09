require 'tic_tac_toe'

  yes_gets = double("yes_gets")

  describe 'start_game' do

    context 'when user starts game' do
      it 'the game should start' do
        allow($stdin).to receive(:gets).and_return(yes_gets)

        expect(yes_gets).to receive(:chomp).and_return('y')
      end
    end
  end




