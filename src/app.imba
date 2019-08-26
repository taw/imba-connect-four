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
  def render
    <self>

tag Column < svg:g
  def render
    <self>
      <svg:g transform="translate({100*data}, 0)">
        <svg:rect.highlight x=0 y=0 width=100 height=600>
        <Box[0]>
        <Box[1]>
        <Box[2]>
        <Box[3]>
        <Box[4]>
        <Box[5]>

  def onclick
    trigger("columnclicked", data)

tag Board < svg:svg
  def render
    <self>
      <Column[0]>
      <Column[1]>
      <Column[2]>
      <Column[3]>
      <Column[4]>
      <Column[5]>
      <Column[6]>

tag Status
  def render
    <self>
      <h2>
        if data == "red"
          "Red turn"
        else
          "Blue turn"


tag App
  def setup
    @turn = "red"
    @board = [[], [], [], [], [], [], []]

  def oncolumnclicked(i)
    # first check if click is valid
    if @turn == "red"
      @turn = "blue"
    else
      @turn = "red"
    0

  def render
    <self.{@turn}>
      <header>
        "Connect Four"
      <Status[@turn]>
      <Board[@board]>

Imba.mount <App>
