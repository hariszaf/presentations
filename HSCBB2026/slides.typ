#import "@preview/polylux:0.4.0": *
#import "@preview/friendly-polylux:0.1.0" as friendly
#import friendly: titled-block
#import "@preview/tiaoma:0.2.1"  // QR codes

#show: friendly.setup.with(
  short-title: [Gossip in the Microbiome],
  short-speaker: [Zafeiropoulos],
)

#set text(size: 30pt, font: "Andika")
#show raw: set text(font: "Fantasque Sans Mono")
#show math.equation: set text(font: "Lete Sans Math")
// make web/email links stand out; internal links stay as they are
#show link: it => if type(it.dest) == str {
  // the title-slide website link is drawn smaller
  let size = if it.dest == "https://hariszaf.github.io" { 0.7em } else { 1em }
  underline(offset: 2pt, text(size: size, fill: rgb("#e7a90d"), it))
} else { it }

#friendly.title-slide(
  title: [
    Gossip in the Microbiome: Metabolic Secrets Behind Microbial Co-Occurrence
  ],
  speaker: [
    #pad(top: -0.7cm)[
      Haris Zafeiropoulos
      #v(-0.6em)
      #block(below: 0.3em, text(size: 0.4em)[
        #set par(leading: 0.35em, spacing: 0.6em)
        Post-doctoral researcher \ 
        Mechanisms of Microbial Metabolic Interactions (m3i) 

        Friedrich Schiller University Jena \
        Cluster of Excellence Balance of the Microverse \
        Institute of Biodiversity, Ecology and Evolution
      ])
    ]
    #v(-1.4em)  // pulls the website line up under the affiliation
  ],
  conference: [
     HSCBB26
  ],
  speaker-website: "hariszaf.github.io", // theme adds https:// itself; use `none` to disable
  slides-url: "https://github.com/hariszaf/presentations/tree/main/HSCBB2026",
  qr-caption: text(font: "Excalifont")[Get these slides],
  logo: image("figs/microbetag_logo.png", height: 5em),
)

#slide[
  = Making sense of a hairball is hard  //Who lives with whom?
  #set text(0.8em)
  Amplicon / metagenomic surveys → *co-occurrence networks*:
  thousands of *undirected* edges between taxa that appear together (or avoid each other).

  #align(center)[#image("figs/hairball_squeezed.png", height: 5.5cm)]

  #align(center)[_Who_ is working with _who_ and _how_?]
]

#slide[
  = A co-occurrence network in Cytoscape
  #align(center)[#image("figs/cytopanel.png", width: 72.5%)]
]


// [2:30–3:30] Idea
#slide[
  = microbetag: a hypothesis generator
  #set text(0.8em)
  We cannot prove interactions from co-occurrence / mutual exclusion alone,
  but genomes can suggest *why* two taxa show such a pattern:

  - _complementary_ pathways → *cross-feedings*?
  - overlapping needs → *competition*?
  - shared traits → same *niche*?

  #titled-block(title: [microbetag])[
    Turns the hairball into *testable hypotheses*
  ]
]

// small flow-diagram helpers
#let accent = rgb("#3b5b92")
#let step(title, body, fill: rgb("#eef2f8")) = box(
  width: 100%, inset: 0.45em, radius: 6pt, fill: fill, stroke: 1pt + accent,
  align(center)[#text(weight: "bold", fill: accent, title) \ #text(size: 0.8em, body)],
)
#let arrow = align(center + horizon, text(size: 1.4em, fill: accent)[→])

#slide[
  = How microbetag works
  \
  #set text(0.55em)
  #grid(
    columns: (1fr, auto, 1fr, auto, 1.25fr, auto, 1fr, auto, 1fr),
    column-gutter: 0.35em,
    row-gutter: 1.8em,
    align: horizon,
    // 1. input
    stack(spacing: 0.4em,
      step([Abundance table], [16S / shotgun]),
      align(center)[_or_],
      step([Network], [co-occurrence]),
    ),
    arrow,
    // 2. genomes
    stack(spacing: 0.4em,
      step([GTDB v207], [our server]),
      align(center)[_or_],
      step([Your genomes], [Nextflow, locally]),
    ),
    arrow,
    // 3. annotation
    stack(spacing: 0.4em,
      step([Nodes], [phenDB traits \ FAPROTAX functions], fill: rgb("#f5e6b8")),
      step([Edges], [pathway complementarity \ seed scores], fill: rgb("#f5e6b8")),
    ),
    arrow,
    // 4. output
    step([Annotated network], [nodes + edges \ with hypotheses]),
    arrow,
    // 5. exploration
    step([Cytoscape + MGG], [filter, cluster, \ enrichment]),
    // stage labels, one under each box column (arrow columns stay empty)
    ..("Input", "Genomes", "Annotation", "Output", "Explore")
      .map(l => (align(center, text(size: 0.9em, fill: luma(90), weight: "bold", l)), []))
      .flatten().slice(0, 9),
  )
]

// [4:30–5:15] Node annotations
#slide[
  = Node level: what are a species' phenotypic traits?
  #set text(0.75em)
  Each taxon gets *functional traits*: genome-based predictions (phenotrex)
  and literature-based *FAPROTAX* functions (105 in total), e.g.:

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.8em,
    titled-block(title: [Carbon])[
      - methanogenesis
      - fermentation
      - cellulolysis
    ],
    titled-block(title: [Nitrogen & sulfur])[
      - nitrogen fixation
      - denitrification
      - sulfate respiration
    ],
    titled-block(title: [Lifestyle])[
      - obligate anaerobes
      - human gut
      - plant pathogen
    ],
  )
]

// [5:15–6:30] Enrichment — key feature
// [TODO] Fix figure so clusters are not identical 
// 
#let enrichment-fig = box(width: 11.5cm, height: 8.3cm, {
  place(line(start: (1.39cm, 2.11cm), end: (2.76cm, 2.21cm), stroke: 0.7pt + luma(170)))
  place(line(start: (2.76cm, 2.21cm), end: (3.65cm, 2.30cm), stroke: 0.7pt + luma(170)))
  place(line(start: (3.65cm, 2.30cm), end: (3.38cm, 3.04cm), stroke: 0.7pt + luma(170)))
  place(line(start: (3.38cm, 3.04cm), end: (2.71cm, 3.57cm), stroke: 0.7pt + luma(170)))
  place(line(start: (2.71cm, 3.57cm), end: (2.06cm, 3.65cm), stroke: 0.7pt + luma(170)))
  place(line(start: (2.06cm, 3.65cm), end: (2.24cm, 2.82cm), stroke: 0.7pt + luma(170)))
  place(line(start: (2.24cm, 2.82cm), end: (1.24cm, 3.34cm), stroke: 0.7pt + luma(170)))
  place(line(start: (3.38cm, 3.04cm), end: (1.24cm, 3.34cm), stroke: 0.7pt + luma(170)))
  place(line(start: (2.76cm, 2.21cm), end: (3.65cm, 2.30cm), stroke: 0.7pt + luma(170)))
  place(line(start: (2.76cm, 2.21cm), end: (1.39cm, 2.11cm), stroke: 0.7pt + luma(170)))
  place(line(start: (8.96cm, 1.90cm), end: (8.84cm, 1.13cm), stroke: 0.7pt + luma(170)))
  place(line(start: (8.84cm, 1.13cm), end: (9.80cm, 1.87cm), stroke: 0.7pt + luma(170)))
  place(line(start: (9.80cm, 1.87cm), end: (8.96cm, 3.05cm), stroke: 0.7pt + luma(170)))
  place(line(start: (8.96cm, 3.05cm), end: (8.34cm, 2.53cm), stroke: 0.7pt + luma(170)))
  place(line(start: (8.96cm, 1.90cm), end: (8.96cm, 3.05cm), stroke: 0.7pt + luma(170)))
  place(line(start: (4.78cm, 5.77cm), end: (5.42cm, 5.66cm), stroke: 0.7pt + luma(170)))
  place(line(start: (5.42cm, 5.66cm), end: (6.22cm, 5.42cm), stroke: 0.7pt + luma(170)))
  place(line(start: (6.22cm, 5.42cm), end: (7.55cm, 6.60cm), stroke: 0.7pt + luma(170)))
  place(line(start: (7.55cm, 6.60cm), end: (6.00cm, 6.76cm), stroke: 0.7pt + luma(170)))
  place(line(start: (6.00cm, 6.76cm), end: (5.42cm, 6.48cm), stroke: 0.7pt + luma(170)))
  place(line(start: (5.42cm, 6.48cm), end: (4.49cm, 6.37cm), stroke: 0.7pt + luma(170)))
  place(line(start: (6.00cm, 6.76cm), end: (4.78cm, 5.77cm), stroke: 0.7pt + luma(170)))
  place(line(start: (6.00cm, 6.76cm), end: (7.55cm, 6.60cm), stroke: 0.7pt + luma(170)))
  place(line(start: (4.49cm, 6.37cm), end: (7.55cm, 6.60cm), stroke: 0.7pt + luma(170)))
  place(line(start: (4.49cm, 6.37cm), end: (6.22cm, 5.42cm), stroke: 0.7pt + luma(170)))
  place(line(start: (5.42cm, 5.66cm), end: (7.55cm, 6.60cm), stroke: 0.7pt + luma(170)))
  place(line(start: (5.42cm, 5.66cm), end: (5.42cm, 6.48cm), stroke: 0.7pt + luma(170)))
  place(line(start: (7.55cm, 6.60cm), end: (5.42cm, 6.48cm), stroke: 0.7pt + luma(170)))
  place(line(start: (3.65cm, 2.30cm), end: (8.34cm, 2.53cm), stroke: 0.7pt + luma(170)))
  place(line(start: (2.71cm, 3.57cm), end: (4.78cm, 5.77cm), stroke: 0.7pt + luma(170)))
  place(line(start: (8.34cm, 2.53cm), end: (6.22cm, 5.42cm), stroke: 0.7pt + luma(170)))
  place(dx: 0.50cm, dy: 1.05cm, ellipse(width: 4.00cm, height: 3.10cm, stroke: (paint: rgb("#2e7d32"), thickness: 1.2pt, dash: "dashed")))
  place(dx: 0.50cm, dy: 0.50cm, box(width: 4.00cm, align(center, text(size: 13pt, weight: "bold", fill: rgb("#2e7d32"))[enriched])))
  place(dx: 7.75cm, dy: 0.45cm, ellipse(width: 2.70cm, height: 3.50cm, stroke: (paint: rgb("#c62828"), thickness: 1.2pt, dash: "dashed")))
  place(dx: 7.75cm, dy: -0.10cm, box(width: 2.70cm, align(center, text(size: 13pt, weight: "bold", fill: rgb("#c62828"))[depleted])))
  place(dx: 3.60cm, dy: 5.10cm, ellipse(width: 4.60cm, height: 2.40cm, stroke: (paint: rgb("#777777"), thickness: 1.2pt, dash: "dashed")))
  place(dx: 3.60cm, dy: 7.55cm, box(width: 4.60cm, align(center, text(size: 13pt, weight: "bold", fill: rgb("#777777"))[n.s.])))
  place(dx: 2.02cm, dy: 2.60cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 3.16cm, dy: 2.82cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
  place(dx: 2.54cm, dy: 1.99cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 2.49cm, dy: 3.35cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 3.43cm, dy: 2.08cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 1.02cm, dy: 3.12cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 1.17cm, dy: 1.89cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 1.84cm, dy: 3.43cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 9.58cm, dy: 1.65cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
  place(dx: 8.74cm, dy: 1.68cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
  place(dx: 8.62cm, dy: 0.91cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
  place(dx: 8.74cm, dy: 2.83cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
  place(dx: 8.12cm, dy: 2.31cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
  place(dx: 5.78cm, dy: 6.54cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
  place(dx: 4.27cm, dy: 6.15cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 5.20cm, dy: 5.44cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
  place(dx: 4.56cm, dy: 5.55cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 7.33cm, dy: 6.38cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
  place(dx: 6.00cm, dy: 5.20cm, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92")))
  place(dx: 5.20cm, dy: 6.26cm, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92")))
})

#slide[
  = Clusters & enrichment analysis
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1.2em,
    align: horizon,
    enrichment-fig,
    text(size: 15pt)[
      #box(baseline: 20%, circle(radius: 0.22cm, fill: rgb("#d4a017"), stroke: 1pt + rgb("#3b5b92"))) taxon *with* the trait \
      #box(baseline: 20%, circle(radius: 0.22cm, fill: white, stroke: 1pt + rgb("#3b5b92"))) taxon *without*

      #v(0.8em)
      + *Cluster* the network (e.g. #link("https://github.com/ramellose/manta")[manta])
      + Per cluster & trait: *hypergeometric test* (#link("https://en.wikipedia.org/wiki/Hypergeometric_distribution#Hypergeometric_test")[wiki])
      + FDR correction → *enriched* / *depleted*

      #v(0.8em)
      #box(inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
        Each cluster reads as a *functional guild*
      ]
    ],
  )
]

// [6:30–7:45] Edge annotations
#slide[
  = Edge level: what could they exchange?
  #set text(0.8em)
  #titled-block(title: [Pathway complementarity])[
    KEGG modules one taxon misses and its partner can complete
  ]
  #titled-block(title: [Seed scores])[
    Competition and cooperation potential from metabolic network seed sets
  ]
  #titled-block(title: [Seed complementarity])[
    Candidate exchanged compounds from genome-scale models
  ]
]


#slide[
  = The seed concept 
  #set text(0.7em)
  #grid(
    columns: (0.4fr, 0.6fr),
    column-gutter: 1em,
    align: horizon,
    
    [Pseudo metabolitc networks of species A and B],
    align(center, image("figs/seed-scores-examples.png", height: 80%)),
  )
]


#slide[
  = Seed complementarity 

  #image("figs/seed_compl.png", width: 80%)
  
]



// MGG: exploring the annotated network
#let panel(path, caption) = stack(
  spacing: 0.3em,
  image(path, height: 6cm),
  align(center, text(size: 13pt, caption)),
)

#slide[
  = Parsing the network with MGG
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    rows: (auto, auto),
    row-gutter: 0.6em,
    align: top,
    image("figs/mgg_menu.png", height: 3.2cm),
    text(size: 15pt)[
      + *Import* abundance table, taxonomy, metadata
      + *Get annotated network* from our server, or import your local one
      + Click a *node* or *edge* to read its annotations,
        *filter* edges by correlation or seed scores
      + Run *MGG Enrichment* on clusters
    ],
    grid.cell(colspan: 2, align(center, stack(
      dir: ltr,
      spacing: 0.8em,
      panel("figs/nodes-panels.png", [*Nodes*: taxonomy, phenDB / FAPROTAX]),
      panel("figs/edges-panelA.png", [*Edges*: filters, donor → beneficiary]),
      panel("figs/edges-panelB.png", [*Edges*: KEGG modules, seed scores]),
    ))),
  )
]


#slide[ 
  = An annotated network in Cytoscape

  #align(center)[#image("figs/annotated_cytopanel.png", width: 72.5%)]
]



// [7:45–8:30] Tooling
#slide[
  = Two ways to run microbetag
  #set text(0.75em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    titled-block(title: [On our server])[
      - Against *GTDB v207* genomes
      - Submit your *abundance table* or *network*
        through the #link("https://apps.cytoscape.org/apps/mgg")[MGG Cytoscape app]
      - Results come back as an annotated network
    ],
    titled-block(title: [Locally, with your genomes])[
      - New: *Nextflow* pipeline
      - Use your own genomes / MAGs
      - Import the annotated network into Cytoscape with MGG
    ],
  )

  Either way: explore, filter and cluster the annotated network in *Cytoscape*.

  #align(center)[
    #link("https://microbetag.readthedocs.io/")[microbetag.readthedocs.io] ·
    #link("https://github.com/msysbio/microbetag")[github.com/msysbio/microbetag]
  ]
]

// [8:30–10:15] Case study
#slide[
  = Case study: infant gut
  #grid(
    columns: (0.8fr, 1.3fr),
    column-gutter: 1em,
    align: horizon,
    text(size: 15pt)[
      #text(fill: luma(110), size: 12pt)[Cabrera _et al._ (2019) \ iron supplementation in infants]

      #v(0.5em)
      #box(inset: 0.5em, radius: 6pt, stroke: 1pt + rgb("#3b5b92"), width: 100%, align(center)[
        _E. lenta_ #text(fill: rgb("#d4a017"), size: 1.3em)[ → ] _F. plautii_ \
        #text(size: 11pt, fill: luma(90))[ASV0107 donor #h(2.5em) ASV0012 beneficiary]
      ])

      #v(0.5em)
      *Complements:* L-valine, (R)-pantothenate \
      → vitamin B5 → *coenzyme A*

      #v(0.5em)
      #box(inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"), width: 100%)[
        *Hypothesis:* FOS boosts butyrate & _Flavonifractor_ partly via *cross-feeding partners*
      ]
    ],
    image("figs/pantothenate.png", height: 9.5cm),
  )
]

// [10:15–11:00] Limits
#slide[
  = Limits — and what's next
  #set text(0.8em)
  - Hypotheses, not proof: needs experimental validation
  - Inherits the network's biases (depth, rare taxa, scale)
  - Genome coverage: unmapped taxa stay unannotated
  - Next: *interactions' dynamics* — do predicted interactions show up under different media ?
  
  #grid(
    columns: (1fr, auto, 1fr, auto, 1.5fr),
    column-gutter: 0.5em,
    align: center + horizon,
    image("figs/mptool.png", width: 60%),
    text(size: 1.8em, weight: "bold")[+],
    image("figs/dingo.jpg", width: 60%),
    text(size: 1.8em, weight: "bold")[→],
    image("figs/exchanges-prob.png", width: 60%),
  )
]

// [11:00–12:00] Take-home
// QR code with a handwritten caption, matching the theme's style
#let qr(url, caption, size: 3.5cm) = stack(
  spacing: 0.3em,
  link(url, tiaoma.qrcode(url, options: (scale: 2.0), width: size)),
  align(center, text(font: "Excalifont", size: 0.35em, caption)),
)

#slide[
  = Take-home
  #titled-block(title: [microbetag])[
    #set text(0.8em)
    Makes sense of the hairball: from *who is with whom*
    to testable hypotheses of *what they do and exchange*.
  ]
  #grid(
    columns: (auto, auto, 1fr),
    rows: (auto, auto),
    column-gutter: 0.8em,
    row-gutter: 0.4em,
    align: center + horizon,
    qr("https://apps.cytoscape.org/apps/mgg", [Cytoscape app], size: 2.7cm),
    qr("https://microbetag.readthedocs.io/", [Read the docs], size: 2.7cm),
    grid.cell(rowspan: 2, image("figs/seedComplPanel.png", height: 6cm)),
    qr("https://matrix.to/#/#microbetagcommunity:matrix.org", [Issues & feedback (Matrix)], size: 2.7cm),
    qr("https://doi.org/10.1186/s13059-025-03769-2", [Read the paper], size: 2.7cm),
  )
]

// Acknowledgements
#let person(photo, name, affil, size: 3.4cm, name-size: 0.55em) = stack(
  spacing: 0.3em,
  align(center, box(clip: true, radius: 50%, width: size, height: size,
    image(photo, width: size, height: size, fit: "cover"))),
  align(center, text(size: name-size, weight: "bold", name)),
  if affil != none { align(center, text(size: 0.42em, fill: luma(80), affil)) },
)

#slide[
  = Acknowledgements
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1em,
    align: top,
    person("figs/ack_faust.jpg", [Prof. Karoline Faust],
      [Microbial Systems Biology lab \ 
      #v(-0.5em) 
      #image("figs/logo_kuleuven.svg", height: 0.7cm)], size: 2.2cm
    ),
    person("figs/ack_morris.jpg", [John "Scooter" Morris],
      [RBVI, UC San Francisco \ #v(-0.5em) #image("figs/logo_nrnb_dark.svg", height: 0.7cm)], size: 2.2cm),
    person("figs/ack_ermis.jpg", [Ermis Delopoulos],
      [MGG development \
            #v(-0.5em) 
      #image("figs/logo_kuleuven.svg", height: 0.7cm)],
       size: 2.2cm),
  )
  #v(-0.2em)
  #align(center, block(breakable: false, inset: (x: 0.8em, y: 0.35em), radius: 8pt, stroke: 0.8pt + luma(200))[
    #box(baseline: 25%, image("figs/logo_eth.jpg", height: 0.9cm)) #h(0.3em)
    #text(size: 0.5em, weight: "bold")[testing the software]
    #v(-0.9em)
    #grid(
      columns: (auto, auto, auto),
      column-gutter: 2em,
      person("figs/ack_schneider.jpg", [Aline Schneider], none, size: 1.6cm, name-size: 0.42em),
      person("figs/ack_geirnaert.jpg", [Annelies Geirnaert], none, size: 1.6cm, name-size: 0.42em),
      person("figs/ack_erega.jpg", [Andrea Erega], none, size: 1.6cm, name-size: 0.42em),
    )
  ])
  #v(-0.3em)
  #align(center, text(size: 0.5em)[
    *Funding:* #link("https://www.3domics.eu/")[#box(baseline: 30%, image("figs/logo_3domics.png", height: 1.3em))] (EU Horizon) ·
    #link("https://nrnb.org/gsoc.html")[#box(baseline: 30%, image("figs/logo_gsoc.svg", height: 1.3em))] with #link("https://nrnb.org/")[#box(baseline: 20%, image("figs/logo_nrnb_dark.svg", height: 1.1em))]
  ])
]

// Last slide: two QR codes (project + slides) in the theme's style;
// friendly.last-slide only supports one, so this is a regular slide.
#let gold-qr(url, caption) = stack(
  spacing: 0.3em,
  link(url, tiaoma.qrcode(url, options: (fg-color: rgb("#E8C872"), bg-color: none), width: 4.6cm)),
  align(center, text(font: "Excalifont", size: 0.5em, caption)),
)

#slide[
  = Thank you for your attention!
  #v(1fr)
  #grid(
    columns: (auto, auto, 1fr),
    column-gutter: 1.2em,
    align: horizon,
    gold-qr("https://github.com/hariszaf/presentations/tree/main/HSCBB2026", [Get these slides]),
    gold-qr("https://github.com/msysbio/microbetag", [microbetag on GitHub]),
    [
      #set text(size: 0.8em)
      I'd be happy to take your questions -- or get in touch later #emoji.hand.wave
      #v(0.6em)
      #set text(size: 0.65em)
      #grid(columns: 2, column-gutter: 0.5em, row-gutter: 0.8em, align: horizon,
        friendly.icons.email, link("mailto:charalampos-zafeiropoulos@uni-jena.de")[charalampos-zafeiropoulos\@uni-jena.de],
        friendly.icons.www, link("https://hariszaf.github.io/")[hariszaf.github.io],  // trailing slash: not shrunk by the title-slide link rule
      )
    ],
  )
  #v(1fr)
]

// --------
// Extras
// --------

// Challenges
#slide[
  = Challenges in co-occurrence inference 
  #set text(0.8em)
  + *Sequencing depth* varies across samples → compositional artefacts
  + *Rare taxa* → sparse counts, unstable correlations
  + *Indirect edges* → A–C may only reflect A–B and B–C; correlation ≠ interaction
  + *Undirected edges* → who affects whom? an edge has no direction
  + *Sampling scale* → interactions happen at the *microscale*,
    but we sample at the *macroscale*
]

// Sampling scale
#slide[
  = Sampling scale
  #grid(
    columns: (0.35fr, 0.65fr),
    column-gutter: 1em,
    align: horizon,
    [
      #set text(0.65em)
      Technical variability. \
      Read count ≠ cell count
    ],
    image("figs/sampling.png", height: 9cm),
  )
]

// Compositionality
#slide[
  = Compositionality
  #align(center)[#image("figs/compositionality.png", width: 60%)]
]
