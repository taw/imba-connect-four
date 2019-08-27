import Box from "./Box"
import Piece from "./Piece"

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

export default Column
