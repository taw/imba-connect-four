tag Box < svg:g
  def render
    <self>
      <svg:g transform="translate(0, {100*data})">
        <svg:path d="M 0,0
                h 100 v 100 h -100 z
                M 50,10
                A 40,40 0 0,1 50,90
                A 40,40 0 0,1 50,10
                z">

export default Box
