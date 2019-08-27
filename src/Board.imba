import Column from "./Column"

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

export default Board
