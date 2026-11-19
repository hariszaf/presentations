#import "@preview/polylux:0.4.0": *
#import "@preview/friendly-polylux:0.1.0" as friendly
#import friendly: titled-block
#import "@preview/tiaoma:0.2.1"  // QR codes

#show: friendly.setup.with(
  short-title: [m3i seminar - 2026.11.24 ],
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


// ----------------
// Fot status table
#let accent = rgb("#3b5b92")

#let chip(label, color) = box(
  inset: (x: 0.5em, y: 0.25em),
  radius: 4pt,
  fill: color.lighten(82%),
  stroke: 0.8pt + color,
  text(size: 0.85em, weight: "bold", fill: color.darken(12%), label),
)

#let st-release   = chip([new release], rgb("#2e7d32"))
#let st-published = chip([published],   rgb("#2e7d32"))
#let st-accepted  = chip([accepted],   rgb("#2e7d32"))
#let st-review    = chip([in review],   accent)
#let st-revision  = chip([under revision],   rgb("#3b928e")
)
#let st-running   = chip([running],     rgb("#c08a00"))
#let st-blocked   = chip([blocked],     rgb("#c62828"))
#let st-planned   = chip([planned],     luma(120))

#let project(name, desc) = [
  #text(weight: "bold", name) \
  #text(size: 0.78em, fill: luma(110), desc)
]
// ----------------



#friendly.title-slide(
  title: [
    Updates on running projects 
  ],
  speaker: [
    #pad(top: -0.7cm)[
      // Haris Zafeiropoulos
      #v(-0.6em)
      #block(below: 0.3em, text(size: 0.4em)[
        #set par(leading: 0.35em, spacing: 0.6em)
        // Post-doctoral researcher \ 
        // Mechanisms of Microbial Metabolic Interactions (m3i) 

        Friedrich Schiller University Jena \
        Cluster of Excellence Balance of the Microverse \
        // Institute of Biodiversity, Ecology and Evolution
      ])
    ]
    #v(-1.4em)  // pulls the website line up under the affiliation
  ],
  conference: [
     m3i seminars
  ],
  speaker-website: "hariszaf.github.io", // theme adds https:// itself; use `none` to disable
  slides-url: "https://github.com/hariszaf/presentations/tree/main/OXYFLEX-1",
  qr-caption: text(font: "Excalifont")[Get these slides],
  logo: image("figs/avatar.png", height: 5em),
)

// --- helpers for the stub phase -------------------------------------
// A grey box standing in for a figure you haven't made/exported yet.
#let todo-fig(caption, height: 6cm) = align(center, block(
  width: 90%, height: height, radius: 8pt,
  fill: luma(245), stroke: (paint: luma(180), thickness: 1pt, dash: "dashed"),
  align(center + horizon, text(size: 0.5em, fill: luma(110), caption)),
))

// A divider between the two project blocks.
#let divider(name, subtitle) = slide[
  #align(center + horizon)[
    #text(size: 1.4em, weight: "bold", name)
    #v(-0.4em)
    #text(size: 0.6em, fill: luma(110), subtitle)
  ]
]

// Placeholder prose, so empty slides are obvious in the PDF.
#let todo(body) = text(fill: rgb("#c62828"), [*TODO:* #body])


// --- 1. Orientation --------------------------------------------------
// One line per project + what you want from the room. No bullet outline.
#slide[
  = Today we discuss on..
  #set text(0.8em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    titled-block(title: [Predicting facultatives])[
      Based on Manisha's previous work, this is what I have been mostly been doing this last month
      #v(0.3em)
      #text(size: 0.8em, fill: luma(110))[
        updates · open questions
      ]
    ],
    titled-block(title: [Metabolic indices])[
      Collective brainstorming on what we can do with our so-far catalog
      #v(0.3em)
      #text(size: 0.8em, fill: luma(110))[benchmarking · when to use · _how-to_]
    ],
  )
  #v(0.5em)
  An *idea* of mine to bring together the two things I enjoy to study the most -- not history #emoji.face.smile.sweat .
]


#slide[
  = But before that, some news!

  #set text(0.6em)
  #table(
    columns: (1.7fr, 1fr),
    align: (left + horizon, center + horizon),
    inset: (x: 0.7em, y: 0.65em),
    stroke: (x, y) => (
      top:    if y <= 1 { 0pt } else { 0.6pt + luma(215) },
      bottom: if y == 0 { 1.2pt + accent } else { 0pt },
    ),
    fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
    table.header(
      text(weight: "bold", fill: accent)[Project],
      text(weight: "bold", fill: accent)[Status],
    ),

    project([`microbetag`], [nextflow-based, repos re-architecture, *seeds inference fix*, server based on local genome catalog now supported on MGG, FAPROTAX 2]),
    [#st-release #v(0.2em) #text(size: 0.75em, fill: luma(110))[2.0.0]],

    project([Microbiom-ing with my Sis], [ Preoperative anastomotic response microbial subtypes (ARMS) are associated with anastomotic leakage after colorectal cancer surgery]),
    [#st-accepted #v(0.2em) #text(size: 0.75em, fill: luma(110))[in _Gut microbes_]],

    project([`mGrowthDB`], [A community-driven repository for storing microbial growth data]),
    [#st-revision #v(0.2em) #text(size: 0.75em, fill: luma(110))[in _Nature Communications_]],

    // project([something later], [one-line description]),
    // [#st-running],
  )
]


// =====================================================================
//  OXYFLEX
// =====================================================================
#divider(
  [Predicting facultatives], 
  [
    Could we determine whether a strain can tolerate conditions \
    at the oxic–anoxic interface/boundary?
  ]
)

// --- 3. The question -------------------------------------------------
// One sentence. Why this axis, not another one.
#slide[
  = Background

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [

      #titled-block(title: [The phenomenon])[
        #set text(0.5em)
        Species growing in both oxic and anoxic conditions 
      ]

      #titled-block(title: [(some) pros and cons])[
        #set text(0.5em,fill: color.blue)
        Essential for pathogens virulence strategy \
        #set text(fill: color.fuchsia) 
        Replicating and maintaining larger genomes takes extra energy and time

        #link("https://doi.org/10.1111/cmi.13338")[]
      ]

      #titled-block(title: [The question])[
        #set text(0.5em)
        Can we predict strains surving on the edge?
      ]
    ],
    [
      #show figure.caption: set text(size: 0.5em)
      #figure(
        image("figs/facultative_wiki.png", height: 4em),
        caption: [
          Growing at thioglycolate broth.
          From #link("https://en.wikipedia.org/wiki/Facultative_anaerobic_organism")[Wiki].
        ]
      )

      #titled-block(title: [The gain])[
        #set text(0.5em)
        (from a microbial ecology perspective)
        1. *niche partitioning* explained
        2. community *transition* prediction // Anticipate how microbial communities change when oxygen levels fluctuate or when oxic–anoxic boundaries shift.
        3. *microbial interactions* interpretation  // Predict potential competition, cooperation, and cross-feeding between aerobic and anaerobic microorganisms.
        4. *ecological resilience* identification // what taxa can persist through oxygen fluctuations and maintain ecosystem functions under environmental change.
      ]

      ]      

  )
    // 1. obligate aerobes
    // 2. obligate anaerobes
    // 3. facultative anaerobes (gather mostly at the top because aerobic respiration generates more ATP than fermentation.)
    // 4. microaerophiles; need oxygen - they cannot ferment or respire anaerobically. Poisoned by high concentrations of oxygen
    // 5. 
]


#slide[
  = Definitions
  #v(1em)
  // Table 
  #let accent = rgb("#3b5b92")
  #let yes = text(fill: rgb("#2e7d32"), weight: "bold", sym.checkmark)
  #let no  = text(fill: rgb("#c62828"), weight: "bold", sym.crossmark)

  #let hdr(body) = text(weight: "bold", fill: accent, body)
  #let sp(name)  = text(style: "italic", size: 0.92em, name)


    #set text(0.42em)
    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto, 1fr),
      align: (left + horizon, ..(center + horizon,) * 6, left + horizon),
      inset: (x: 0.5em, y: 0.5em),
      stroke: (x, y) => (
        top: if y == 2 { 1pt + accent } else if y > 2 { 0.5pt + luma(220) } else { 0pt },
        bottom: 0pt,
      ),
      fill: (x, y) => if y > 1 and calc.odd(y) { luma(249) },

      // two-level header
      table.cell(rowspan: 2, hdr[Organism]),
      table.cell(rowspan: 2, align: center, hdr[Aerobic \ growth]),
      table.cell(rowspan: 2, align: center, hdr[Low-affinity \ oxidase]),
      table.cell(rowspan: 2, align: center, hdr[Microaerobic \ growth]),
      table.cell(rowspan: 2, align: center, hdr[High-affinity \ oxidase]),
      table.cell(rowspan: 2, align: center, hdr[ROS#super[\*] \ defence]),
      table.cell(rowspan: 2, align: center, hdr[Anaerobic \ growth]),
      table.cell(rowspan: 2, align: left, hdr[Representative \ species]),

      [Obligate aerobes],               yes, yes, no,  no,  yes, no,  sp[Mycobacterium leprae],
      [Microaerophiles],                yes, no,  yes, yes, yes, no,  sp[Helicobacter pylori],
      [Facultative anaerobes#super[\*\*]], yes, yes, yes, yes, yes, yes, sp[Escherichia coli],
      [Nanaerobes],                     yes, no,  yes, yes, yes, yes, sp[Bacteroides fragilis],
      [Aerotolerant anaerobes],         no,  no,  no,  no,  yes, yes, sp[Streptococcus pneumoniae],
      [Obligate anaerobes#super[‡]],     no,  no,  no,  no,  no,  yes, sp[Clostridium tetani],
    )

    #v(0.6em)
    #set text(0.72em)
    #text(fill: luma(110))[
      #super[\*]ROS, reactive oxygen species. \
      #super[\*\*]Not all facultative anaerobes have high-affinity oxidases or grow microaerobically. \
      #super[‡]Many obligate anaerobes tolerate transient or low levels of O#sub[2]. \
      Adapted from #link("https://www.nature.com/articles/nrmicro2970")[Morris & Schmidt (2013) _Nat. Rev. Microbiol._]

      High-affinity oxidases scavenge oxygen (O₂) effectively at very low concentrations, 
      whereas low-affinity oxidases operate best when oxygen is abundant (such as atmospheric levels).
  ]
]


#slide[
  = Previous work

  #set text(0.45em)
  #table(
    columns: (auto, auto, 1fr, 1.4fr, 1.2fr),
    inset: 5pt,
    stroke: none,
    align: left + horizon,
    table.hline(),
    table.header([*Study*], [*Software*], [*Predicts*], [*Approach*], [*Facultatives*]),
    table.hline(stroke: 0.5pt),

    [#link("https://doi.org/10.1073/pnas.2515709123")[Liao 2026], \ _PNAS_],
    [#link("github.com/444thLiao/Oxygen_ML")[`Oxygen_ML`]],
    [Aerobe / anaerobe],
    [GBDT selects 40 conserved genes (GBDT40) → logistic regression],
    [Not addressed],

    [#link("https://doi.org/10.64898/2026.01.22.701213")[de Mesquita 2026], \ _bioRxiv_],
    [#link("https://github.com/cliffbueno/oxymetag")[`OxyMetaG`]],
    [Community O#sub[2] preference],
    [Metagenome-level; 20 Pfam families],
    [Not at genome level],

    [#link("https://doi.org/10.1016/j.ygeno.2025.111095")[Wan 2025], \ _Genomics_],
    [#link("https://github.com/gmh007/Bacterial-Oxygen-Requirements-Prediction")[BORP]], //Bacterial-Oxygen-Requirements-Prediction 
    [Aerobe / anaerobe / facultative],
    [ML on Pfam domains (SVM, RF, GBT); top 200 Pfams],
    [Included, but recall 21–34% (0% for SVM and RF before rebalancing)],

    [#link("https://doi.org/10.1038/s42003-025-08313-3")[Koblitz 2025], \ _Commun. Biol._],
    [#link("https://github.com/LeibnizDSMZ/bacdive-AI")[`BacDive-AI`]],
    [Aerobe / anaerobe],
    [Two curated-data classifiers on Pfams],
    [Only by exclusion: "neither aerobe nor anaerobe"],

    [#link("https://doi.org/10.1016/j.ecoinf.2024.102817")[Donhauser 2024], \ _Ecol. Inform._],
    [#link("https://github.com/jdonhauser/MicEnvMod")[`MicEnvMod`]],
    [O#sub[2] preference incl. facultative],
    [Phylogenetic signal (16S similarity)],
    [Inferred from relatives, not genes],

    [#link("https://doi.org/10.1128/msystems.00763-24")[Flamholz 2024], \ _mSystems_],
    [#link("https://github.com/flamholz/annotation_free_dioxygen_utilization")[AFDU]],
    [O#sub[2] utilization from genomes],
    [Annotation-free prediction],
    [–],

    table.hline(),
  )

  #v(0.2em)
  #set text(1.3em)
  #titled-block(title: [The gap])[
    Facultatives are either left out, defined only by exclusion, or predicted with poor recall.
  ]
]


// --- 2. Since last time ----------------------------------------------
// Drop this slide if OXYFLEX is genuinely new to this audience.
#slide[
  = Up to this September 
  #set text(0.75em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    titled-block(title: [Landed])[
      - #todo[]
      - #todo[]
    ],
    titled-block(title: [Didn't land — and why])[
      - #todo[]
    ],
  )
]



// --- 4. Design -------------------------------------------------------
// The slide you will flip back to during questions. Make it readable.
#slide[
  = How we set it up
  #set text(0.7em)
  #todo-fig([experimental design / pipeline schematic — conditions + readouts], height: 7.5cm)
  #v(0.3em)
  #todo[name the conditions and the readouts explicitly]
]


// --- 5. Status -------------------------------------------------------
// Three columns. This is where collaborators volunteer themselves.
#slide[
  = Where it stands
  #set text(0.7em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.8em,
    titled-block(title: [Done])[
      - #todo[]
    ],
    titled-block(title: [Running])[
      - #todo[] #text(size: 0.8em, fill: luma(110))[(ETA?)]
    ],
    titled-block(title: [Blocked])[
      - #todo[what's blocking, and on whom]
    ],
  )
]


// --- 6-8. Results ----------------------------------------------------
// One figure per slide. Title = the claim, not a label.
// Each slide: what I see → what I think it means → the caveat.
#slide[
  = #todo[claim 1, as a sentence]
  #set text(0.7em)
  #grid(
    columns: (1.2fr, 0.8fr),
    column-gutter: 1em,
    align: horizon,
    todo-fig([figure 1], height: 8cm),
    [
      *What I see* \ #todo[]
      #v(0.6em)
      *What I think it means* \ #todo[]
      #v(0.6em)
      #text(fill: luma(100))[*Caveat* \ #todo[say it before they do]]
    ],
  )
]

#slide[
  = #todo[claim 2, as a sentence]
  #set text(0.7em)
  #grid(
    columns: (1.2fr, 0.8fr),
    column-gutter: 1em,
    align: horizon,
    todo-fig([figure 2], height: 8cm),
    [
      *What I see* \ #todo[]
      #v(0.6em)
      *What I think it means* \ #todo[]
      #v(0.6em)
      #text(fill: luma(100))[*Caveat* \ #todo[]]
    ],
  )
]

#slide[
  = #todo[claim 3, as a sentence]
  #set text(0.7em)
  #grid(
    columns: (1.2fr, 0.8fr),
    column-gutter: 1em,
    align: horizon,
    todo-fig([figure 3], height: 8cm),
    [
      *What I see* \ #todo[]
      #v(0.6em)
      *What I think it means* \ #todo[]
      #v(0.6em)
      #text(fill: luma(100))[*Caveat* \ #todo[]]
    ],
  )
]



// --- 9. Open questions -----------------------------------------------
// The slide this talk exists for. Keep it BEFORE next steps.
// Be concrete: a decision you can't make, not "feedback welcome".
#slide[
  = What I can't decide
  #set text(0.8em)
  #titled-block(title: [1.])[
    #todo[a specific methodological decision — with the options you see]
  ]
  #titled-block(title: [2.])[
    #todo[a specific interpretation you're unsure about]
  ]
  #v(0.3em)
  #text(size: 0.7em, fill: luma(110))[#todo[name people who could answer, if you know]]
]


// --- 10. Next steps --------------------------------------------------
// Milestones with dates, not a list of verbs.
#slide[
  = Next
  #set text(0.75em)
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    row-gutter: 0.6em,
    align: (right + horizon, left + horizon),
    text(weight: "bold")[#todo[date]], [#todo[milestone]],
    text(weight: "bold")[#todo[date]], [#todo[milestone]],
    text(weight: "bold")[#todo[date]], [#todo[milestone]],
  )
]


// =====================================================================
//  PROJECT 2  — same shape, compressed. Flag it as context.
// =====================================================================
#divider([#todo[project 2 name]], [context, not today's topic])

#slide[
  = #todo[project 2: the question]
  #set text(0.8em)
  #todo[one short paragraph — why it exists, how it relates (or doesn't) to OXYFLEX]
]

#slide[
  = #todo[project 2: where it stands]
  #set text(0.75em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: horizon,
    [
      - #todo[]
      - #todo[]
    ],
    todo-fig([one figure, if you have one], height: 6cm),
  )
]

#slide[
  = #todo[project 2: next]
  #set text(0.8em)
  - #todo[]
  #v(0.5em)
  #text(size: 0.8em, fill: luma(110))[#todo[say explicitly whether you want input on this one too]]
]



// =====================================================================
//  CLOSE
// =====================================================================
// Not "thank you for your attention" — the asks, restated.
#slide[
  = What I'm asking for
  #set text(0.8em)
  + #todo[ask 1 — who, and what exactly]
  + #todo[ask 2]
  #v(0.8em)
  #align(center, text(size: 0.7em, fill: luma(110))[
    #todo[contact / where the data lives, if useful to the room]
  ])
]


// =====================================================================
//  BACKUPS — methods detail, failed conditions, full tables.
//  Internal seminars generate specific questions; answer them here
//  instead of drawing on the whiteboard.
// =====================================================================
#divider([Backup slides], [])

#slide[
  = #todo[methods detail]
  #todo-fig([], height: 8cm)
]

#slide[
  = #todo[conditions that didn't work]
  #todo-fig([], height: 8cm)
]

#slide[
  = #todo[full dataset / sample table]
  #todo-fig([], height: 8cm)
]

