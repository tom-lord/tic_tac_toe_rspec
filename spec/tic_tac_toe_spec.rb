require 'tic_tac_toe'

  describe 'start_game' do

    context 'when user starts game' do
      def play_game(*args)
        # Dummy method - so that we can terminate here,
        # i.e. we're only testing the initial setup
      end

      it 'the game should start' do
        allow_any_instance_of(Kernel)
          .to receive(:gets)
          .and_return('y', 'p1_name', 'p2_name')

        expect { start_game }
          .to output(/Ok, let's start!/)
          .to_stdout
      end
    end
  end
