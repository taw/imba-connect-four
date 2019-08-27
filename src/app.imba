import Board from "./Board"
import Status from "./Status"

tag App
  def setup
    @result = null
    @turn = "red"
    @board = [[], [], [], [], [], [], []]

  def lines
    let result = []

    # Vertical
    for x in [0..6]
      for y in [0..2]
        result.push([
          @board[x][y]
          @board[x][y + 1]
          @board[x][y + 2]
          @board[x][y + 3]
        ])

    # Horizontal
    for x in [0..3]
      for y in [0..5]
        result.push([
          @board[x][y]
          @board[x + 1][y]
          @board[x + 2][y]
          @board[x + 3][y]
        ])

    # Diagonal
    for x in [0..3]
      for y in [0..2]
        result.push([
          @board[x][y]
          @board[x + 1][y + 1]
          @board[x + 2][y + 2]
          @board[x + 3][y + 3]
        ])

    # Counter-diagonal
    for x in [3..6]
      for y in [0..2]
        result.push([
          @board[x][y]
          @board[x - 1][y + 1]
          @board[x - 2][y + 2]
          @board[x - 3][y + 3]
        ])

    result

  def is-red-win
    lines.some do |line|
      line.every do |x|
        x == "red"

  def is-blue-win
    lines.some do |line|
      line.every do |x|
        x == "blue"

  def is-draw
    @board.every do |col|
      col:length === 6

  def oncolumnclicked(event, payload)
    let x = payload:x
    # first check if click is valid
    if @board[x]:length >= 6
      return
    @board[x].push @turn

    # Now check if game ended
    if is-draw
      @result = "Draw"
    else if is-red-win
      @result = "Red won"
    else if is-blue-win
      @result = "Blue won"

    if @result
      @turn = null
    else if @turn == "red"
      @turn = "blue"
    else
      @turn = "red"

    0

  def render
    <self.{@turn}>
      <header>
        "Connect Four"
      <Status result=@result turn=@turn>
      <Board[@board]>


Imba.mount <App>
