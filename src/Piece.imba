tag Piece < svg:g
  prop y
  prop contents

  def render
    <self>
      if contents
        <svg:circle.{contents} cx=50 cy=(550-100*y) r=45>

export default Piece
