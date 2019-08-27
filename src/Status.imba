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

export default Status
