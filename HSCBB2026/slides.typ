#import "@preview/polylux:0.4.0": *
#import "@preview/friendly-polylux:0.1.0" as friendly
#import friendly: titled-block

#show: friendly.setup.with(
  short-title: [Gossip in the Microbiome],
  short-speaker: [Zafeiropoulos],
)

#set text(size: 30pt, font: "Andika")
#show raw: set text(font: "Fantasque Sans Mono")
#show math.equation: set text(font: "Lete Sans Math")

#friendly.title-slide(
  title: [
    Gossip in the Microbiome: Metabolic Secrets Behind Microbial Co-Occurrence
  ],
  speaker: [Haris Zafeiropoulos],
  conference: [Hellenic Society for Computational Biology and Bioinformatics 2026],
  speaker-website: "https://m3i-lab.github.io/", // use `none` to disable
  slides-url: "https://github.com/hariszaf/presentations/tree/main/HSCBB2026", // use `none` to disable
  qr-caption: text(font: "Excalifont")[Get these slides],
  logo: image("figs/microbetag_logo.png", height: 5em),
)

#slide[
  = My first slide
  With some maths: $x^2 + y^2 = z^2$

  And some code: `Typst *rocks*!`

  #titled-block(title: [A block])[
    Some important content
  ]
]

#friendly.last-slide(
  title: [That's it!],
  project-url: "https://github.com/msysbio/microbetag",
  qr-caption: text(font: "Excalifont")[My project on GitHub],
  contact-appeal: [Get in touch #emoji.hand.wave],
  // leave out any of the following if they don't apply to you:
  email: "charalampos-zafeiropoulos@uni-jena.de",
  // email: "haris.zafeiropoulos@atomicmail.io",
  mastodon: "@foo@baz.org",
  website: "https://hariszaf.github.io",
  // linkedin: "had", 
  // github: "hariszaf"
)
