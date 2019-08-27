tag Box < svg:g
  def render
    <self>
      <svg:g transform="translate(0, {100*data})">
        <svg:path d="M 0,0
                h 100 v 100 h -100 z
                M 50,5
                A 45,45 0 0,1 50,95
                A 45,45 0 0,1 50,5
                z">


tag Piece < svg:g
  prop y
  prop contents

  def render
    <self>
      if contents
        <svg:circle.{contents} cx=50 cy=(550-100*y) r=45>

tag Column < svg:g
  prop x
  prop contents

  def render
    <self>
      <svg:g transform="translate({100*x}, 0)">
        <svg:rect.highlight x=0 y=0 width=100 height=600>
        <Box[0]>
        <Box[1]>
        <Box[2]>
        <Box[3]>
        <Box[4]>
        <Box[5]>
        <Piece y=0 contents=contents[0]>
        <Piece y=1 contents=contents[1]>
        <Piece y=2 contents=contents[2]>
        <Piece y=3 contents=contents[3]>
        <Piece y=4 contents=contents[4]>
        <Piece y=5 contents=contents[5]>

  def onclick
    trigger("columnclicked", {x: x})

tag Board < svg:svg
  def render
    <self>
      <Column x=0 contents=data[0]>
      <Column x=1 contents=data[1]>
      <Column x=2 contents=data[2]>
      <Column x=3 contents=data[3]>
      <Column x=4 contents=data[4]>
      <Column x=5 contents=data[5]>
      <Column x=6 contents=data[6]>


tag Status
  prop result
  prop turn

  def render
    <self>
      <h2>
        if @result
          @result
        else if @turn == "red"
          "Red turn"
        else
          "Blue turn"


tag App
  def setup
    @result = null
    @turn = "red"
    @board = [[], [], [], [], [], [], []]

  def oncolumnclicked(event, payload)
    let x = payload:x
    # first check if click is valid
    if @board[x]:length >= 6
      return
    @board[x].push @turn

    let draw = @board.every do |col|
      col:length === 6

    if draw
      @result = "draw"
      return

    # Now check if game ended (with win or draw)
    if @turn == "red"
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
