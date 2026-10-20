// Based on template from:
// https://github.com/JL-ghcoder/Typst-Pre-Template
#import "@preview/tiaoma:0.2.1"  // QR codes

// QR code with a handwritten caption, like friendly-polylux
#let qr(url, caption: none, size: 4cm) = align(center, stack(
  spacing: 0.4em,
  link(url, tiaoma.qrcode(url, options: (scale: 2.0), width: size)),
  if caption != none { text(font: "Excalifont", size: 0.7em, caption) },
))

#import "@preview/touying:0.4.2": *
#import "@preview/unify:0.6.0": num //标号
#import "@preview/academic-conf-pre:0.1.0" as theme-aus


#let s = theme-aus.register(aspect-ratio: "4-3") //4-3, 16-9

// Replace the theme's background logo (University of Sydney) on every slide.
// Use `none` for no logo, or e.g. place(bottom + right, dx: -1em, dy: -1em, image("figures/logo.jpg", width: 15%))
#let s = {
  s.methods.touying-new-section-slide = none  // no "Content" slide at each new section
  s.page-args.background = place(
    bottom + right, 
    dx: -1em, 
    dy: -2em, 
    image(
      "figures/logo2_faded.png", 
      width: 20%
    )
  )
  s = (s.methods.colors)(
    self: s,
    primary: rgb("#b98ad5"),       // title bar, highlights
    primary-dark: rgb("#6a3d8a"),  // box headers
    secondary: rgb("#e0c8f0"),
    tertiary: rgb("#8e5bb5"),
  )
  // bullets are built from the colour at register time, so rebuild them
  s.seu-knob-marker = box(width: 0.5em, place(dy: 0.1em, circle(
    radius: 0.25em,
    fill: gradient.radial(s.colors.primary.lighten(100%), s.colors.primary.darken(40%), focal-center: (30%, 30%)),
  )))
  s
}

#let s = (s.methods.info)(
  self: s,
  title: [
    Gossip in the Microbiome
  ],
  short-title: [Interview \@ INRAE],
  subtitle: [
    Inferring microbial interactions and how they evolve
  ],
  author: [Haris Zafeiropoulos],
  date: [19 October 2026],
  institution: [Balance of the Microverse \
    Friedrich Schiller University Jena],
)


// tblock
#let (init, slides, touying-outline, alert, speaker-note, tblock) = utils.methods(s)
#let (slide, empty-slide, title-slide, outline-slide, new-section-slide, ending-slide) = utils.slides(s)


#show: init
// make web/email links stand out (theme purple + underline);
// internal links, like the section navigation in the header, stay as they are
#show link: it => if type(it.dest) == str {
  underline(offset: 2pt, text(fill: rgb("#6a3d8a"), it))
} else { it }

#set text(font: "Andika")                               // all text
#show raw: set text(font: "Fantasque Sans Mono")        // code
#show math.equation: set text(font: "Lete Sans Math")   // maths
#show heading: set text(font: "Excalifont")             // slide titles (optional)
#show: slides.with(title-slide: false)

#title-slide(
  authors: [Haris Zafeiropoulos \ \
 
  #set text(size: 0.9em)
  #link("mailto:haris.zafr@gmail.com")[haris.zafr\@gmail.com]. \
  https://hariszaf.github.io

])

// Slide with Table of Contents (TOC)
// #outline-slide()


= Education
== Education and work experience
#grid(columns: (1fr, 1fr), gutter: 0.8em)[
  #set text(0.8em)
  #tblock(title: [Education & training])[
    - BSc — Biology, National \& Kapodestrian University of Athens, 2016
    - MSc — Bioinformatics, University of Crete, 2018
    - PhD — Developing approaches for the analaysis of HTS, data integration \& metabolic networks, University of Crete, 2022
  ]
][
  #set text(0.8em)
  #tblock(title: [Post-doctoral studies])[
    - Lab of Microbial Systems Biology, KUL, 2022-2026
    - m3i lab, University of Jena, 2026 -
  ]
]

#tblock(title: [In one line])[
  Keen on *microbial interactions*, and building a *toolkit* to study those and their evolution.
]

= Microbial Ecology
== Developing solutions for the analysis of HTS data

#tblock(title: [Amplicon and Metagenomics Analysis])[
  Support large scale (meta)analyses and metadata.
]

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.6em,
  tblock(title: [PEMA])[
    #set text(0.7em)
    An end-to-end pipeline for *environmental DNA metabarcoding*, from raw reads to taxonomy-annotated ASVs/OTUs (12S, 16S, 18S, ITS, COI).
  ],
  tblock(title: [DARN])[
    #set text(0.7em)
    A *Dark mAtteR iNvestigator* for COI amplicons: places reads on a reference tree to reveal how much of the signal is non-target or unknown taxa.
  ],
  tblock(title: [METAGOFLOW])[
    #set text(0.7em)
    A *metagenomics workflow* (CWL) for marine Genomic Observatories, giving reproducible taxonomic and functional profiles packaged as RO-Crates.
  ],
)

#tblock(title: [PREGO])[
  #set text(0.7em)
  Extracting _Processes - Environments - Organisms_ asssociations, using text mining and data integrations on public literature and global repositories (MGnify, JGI/IMG etc.) 
]



= Metabolic modeling
== Genome-scale metabolic models
#tblock(title: [Why metabolic models?])[
  - Link genomes to *phenotypes*: what a microbe can take up, produce and exchange
  - Constraint-based methods (FBA, flux sampling) on genome-scale reconstructions
]

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.6em,
  tblock(title: [DNNGIOR])[
    #set text(0.7em)
    Deep-learning–guided *gap-filling* of draft metabolic reconstructions.

    Now integrated with three GEM reconstruction (ModelSEEDPy, carve, gapseq) and MEMOTE 
    for semi-automated reconstructions. 
  ],
  tblock(title: [Inferring Interactions with FBA])[
    #set text(0.7em)
    Prediction of growth rates with FBA using semi-curated GEMs is currently not sufficiently accurate to predict interaction strengths reliably.

  ],
  tblock(title: [dingo])[
    #set text(0.7em)
    Python package for *flux sampling* and analysis of metabolic networks.

    Able to sample the largest models available, with
    a variety of MCMC algorithms, and
    statistical guarantees.
    
    _Under development_: sampling community models
  ],
)

== dingo: beyond a single optimum
#let takeaway(body) = box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#e0c8f0"), {
  set par(justify: false)
  set text(size: 12pt, hyphenate: false)
  body
})

#align(center, text(size: 15pt)[
  FBA gives *one* optimal flux vector #h(0.4em) vs. #h(0.4em)
  flux sampling explores the *whole* feasible space
])
#v(0.5em)
#grid(
  columns: (0.9fr, 1.1fr),
  column-gutter: 0.8em,
  align: top,
  // left: marginal + GK1, stacked
  stack(spacing: 0.4em,
    // source: https://github.com/GeomScale/dingo (doc/e_coli_aconta.png)
    align(center, image("figures/dingo_aconta.png", height: 5.2cm)),
    takeaway[*Marginal:* the full *distribution* of a reaction's flux, also in *sub-optimal* growth],
    v(0.2em),
    // source: https://github.com/GeomScale/dingo (tutorials/figs/gk1.png)
    align(center, image("figures/dingo_gk1.png", height: 4.6cm)),
    takeaway[*GK1:* flux increases when the SARS-CoV-2 growth rate is maximised -- a potential *antiviral target*],
  ),
  // right: copula, large
  stack(spacing: 0.4em,
    v(1.8cm),
    image("figures/copula_o2_ethenol.svg", width: 100%),
    takeaway[*Copula:* O#sub[2] uptake and ethanol secretion are *negatively* coupled -- more respiration, less fermentation],
  ),
)
#v(1fr)

= Metabolic interactions
== microbetag
// one-line overview, then the two figures as large as the slide allows
#align(center, text(size: 14pt)[
  Network #h(0.3em) → #h(0.3em)
  #box(inset: 0.25em, radius: 4pt, fill: rgb("#e0c8f0"))[*traits*]
  #box(inset: 0.25em, radius: 4pt, fill: rgb("#e0c8f0"))[*pathway complementarity*]
  #box(inset: 0.25em, radius: 4pt, fill: rgb("#e0c8f0"))[*seed scores \& complementarity*]
  #h(0.3em) → #h(0.3em) Cytoscape / MGG
])
#v(0.1em)
#align(center, image("figures/seed_compl.png", height: 7.2cm))
#grid(
  columns: (1fr, auto),
  column-gutter: 0.8em,
  align: horizon,
  text(size: 13pt)[
    #set par(justify: false)
    *Seed complementarity:* a species' missing seed
    can be produced by a partner

    #v(0.4em)
    Precomputed for *GTDB v207*, or run locally (Nextflow)

    #v(0.4em)
    #text(size: 11pt, fill: luma(90))[_Genome Biology_ 26:292 (2025)]
  ],
  image("figures/seedComplPanel.png", height: 6.9cm),
)
#v(1fr)

= Further modeling
== mgrowthdb
#grid(columns: (1fr, 1fr), gutter: 0.8em)[
  #set text(0.8em)
  - A database of *microbial growth* data (curves, conditions, metabolites)
  - Makes experimental data reusable for model building and validation
  - Bridges static metabolic models and *dynamics* over time
][
  // TODO: add a screenshot or growth-curve figure
  #align(center + horizon)[
    #image("figures/mgrowth_chart.svg", width: 105%)
    #image("figures/mgrowthdv-apps.png", width: 110%)
  ]
]

= Motivation

== Research Interests

#tblock(title: [Theoretical Framework for Microbial Interactions])[
  The architecture of metabolic networks as a proxy for
  the evolution of microbial features and their interactions
]
#image("figures/hypotheses_pyramids.png", width: 80%)

#grid(columns: (1.5fr, 1fr), column-gutter: 1em, [
  #set text(0.8em)
  Combining topological approaches (like Minimal Pathways) with 
  constraint-based modeling approaches (sampling)
  to study metabolic interactions space and probabilities
  and their corresponding genomes constraints 
  ], [
    #image("figures/exchanges-prob.png", width: 75%)
  ]
)




== Why I'd like to join
#tblock(title: [The missing piece in my research])[
  #set text(0.8em)
  Metabolic networks tell me which interactions are *possible*;
  to test how they *evolve*, I need to know which ones *persist over time*.
]

#grid(
  columns: (1fr, 1fr),
  gutter: 0.8em,
  tblock(title: [What I would learn])[
    #set text(0.75em)
    - *Dynamic models* of communities (GLV, consumer–resource)
    - *Inferring interactions* from time series (e.g. PINNs)
    - *Stability and coexistence:* what selection can act on
  ],
  tblock(title: [What I would bring])[
    #set text(0.75em)
    - GEMs *reconstruction* (DNNGIOR) and understanding 
    - Flux *sampling* (dingo) GEMs, sub-spaces and community models
    - *Interaction* priors from metabolism (microbetag)
    - *Growth-curve* data for calibration (mgrowthdb)
  ],
)

#tblock(title: [Take-home])[
  #set text(0.85em)
  Metabolism says *who can* interact, dynamics say *who does*:
  together, they let me ask *how* interactions *evolve*.
]
#v(1fr)

#ending-slide(title: [Thanks for Listening.])[
  \
  I am happy to take your questions!


  #set text(0.75em)
  Slides available on #link("https://github.com/hariszaf/presentations/blob/INRAE2026/INRAE2026/main.pdf")[GitHub]

]
