# CLI Tic Tac Toe

This is a command line tic tac toe game written in Ruby. It currently defaults to one player vs the computer, but is flexible to change to be 2 player. It's currently 88% covered by tests, with the command line interface methods left untested. With this narrow a scope, it was straightforward enough to test directly in the command line, but in the future I'd like to add integration testing.

## To Play:
1. Clone this repository.

  ```shell
  git clone git@github.com:lilwillifo/tic_tac_toe.git
  ```

2. Change into the `tic_tac_toe` directory

  ```shell
  cd tic_tac_toe
  ```
3. Run `ruby ttt.rb` to play the game!

4. If you'd like to run the test suite, run `rspec`.

## Features to Add
Right now the computer is not smart. It only moves randomly, rather than knowing to how to block or strategize. It'd be nice to add a method so the computer knew how to block the human player.

Also, currently it would require someone to go into `ttt.rb` to change the game from one player to two player. It'd be nice to add that option for the user to select at the beginning of a game.
