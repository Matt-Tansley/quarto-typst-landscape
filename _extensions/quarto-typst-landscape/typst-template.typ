
#let PrettyTypst(
  // Default document title.
  // 'title' in your .qmd file will override this.
  title: "quarto-typst-landscape",

  // Logo in top right corner.
  typst-logo: none,

  // The document content.
  body
) = {

  // Set document metadata.
  set document(title: title)
  
  // Configure pages.
  set page(
    flipped: true, // landscape
    paper: "a4",
    margin: (left: 2cm, right: 2cm, top: 4cm, bottom: 2cm),
    numbering: "1",
    number-align: right,
    background: place(left + top, rect(
      fill: rgb("#E6E6FA"),
      height: 3cm,
      width: 100%,
    ))
  )
  
  // Set the body font.
  set text(10pt, font: "Ubuntu")

  // Configure headings.
  show heading.where(level: 1): set block(above: 0.6cm, below: 0.6cm)
  show heading.where(level: 2): set block(above: 0.6cm, below: 0.6cm)

  // Links should be purple.
  show link: set text(rgb("#800080"))

  // Configure light purple border.
  show figure: it => block({
    move(dx: -3%, dy: 1.5%, rect(
      fill: rgb("FF7D79"),
      inset: 0pt,
      move(dx: 3%, dy: -1.5%, it.body)
    ))
  })

  // Purple border column
  grid(
    columns: (1fr),

    // Title.
    pad(bottom: 1cm, text(font: "Ubuntu", 20pt, weight: 800, upper(title))),
    
    // The main body text.
    {
      set par(justify: true)
      body
      v(1fr)
    },
  )
}

