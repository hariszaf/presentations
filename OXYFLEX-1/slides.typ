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
#let st-rejected   = chip([rejected],     rgb("#c62828"))
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
  = Today's main focus lies on..
  #set text(0.6em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    titled-block(title: [Predicting facultatives])[
      Following Manisha's work, let's try to 
      agree on some *terms*, 
      check some first *findings* regarding the prediction of such taxa, 
      address some *challenges* in this task, and 
      come up with *a story to tell*!
      #v(0.3em)
      #text(size: 0.8em, fill: luma(110))[
        updates · open questions
      ]
    ],
    titled-block(title: [Metabolic Interactions indices])[
      Based on our so-far journal clubs and study, let's have a quick 
      *overview* of what we have seen so-far, 
      and then have a *collective brainstorming* on what we can do next, and how-who!
      #v(0.3em)
      #text(size: 0.8em, fill: luma(110))[benchmarking · _when_ and _how-to_ use]
    ],
  )
  #v(0.5em)
  #titled-block(title:[Philosophy of Biology])[
  A *suggestion* for a *book club* aiming at bringing together the two things I enjoy studying the most -- besides history #emoji.face.smile.sweat .]
]


#slide[
  = But before that, some news!

  #set text(0.55em)
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

    project([microbetag], [nextflow-based, repos re-architecture, *seeds inference fix*, server based on local genome catalog now supported on MGG, FAPROTAX 2]),
    [#st-release #v(0.2em) #text(size: 0.75em, fill: luma(110))[2.0.0]],

    project([Microbiom-ing with my Sis], [ Preoperative anastomotic response microbial subtypes (ARMS) are associated with anastomotic leakage after colorectal cancer surgery]),
    [#st-published #v(0.2em) #text(size: 0.75em, fill: luma(110))[in _Gut microbes_]],

    project([mGrowthDB], [A community-driven repository for storing microbial growth data]),
    [#st-revision #v(0.2em) #text(size: 0.75em, fill: luma(110))[in _Nature Communications_]],

    project([StrategAux], [My DFG Walter Benjamin proposal on a quantitative framework linking RHs to metabolic dependencies]),
    [#st-rejected #v(0.2em) #text(size: 0.75em, fill: luma(110))[to be resubmitted]],

    // project([something later], [one-line description]),
    // [#st-running],
  )
]


// =====================================================================
//  PROJECT 1 -- OXYFLEX
// =====================================================================
#divider(
  [Predicting facultatives], 
  [
    Could we determine whether a strain can tolerate conditions \
    at the oxic–anoxic interface/boundary?
  ]
)

// Background
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
        Survive in cases _on the edge_ \
        #set text(fill: color.fuchsia) 
        Replicating and maintaining larger genomes takes extra energy and time
        // #link("https://doi.org/10.1111/cmi.13338")[]
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


// Definitions
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

// Previous work
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


// Training data in Liao et al. 2025
#slide[
  = Training data in Liao et al. 2025

  #grid(
      columns: (1.4fr, 0.8fr),
    column-gutter: 1em,
    [
      #image("figs/Liao2025.png", height: 80%)
    ],
    [
      #set text(0.6em)
      From: #link("https://doi.org/10.1073/pnas.2515709123")[Liao 2026], _PNAS_ \
      Phylogenetic structure and phenotypic diversity of training datasets based on bacterial oxygen requirements. 
      Using 8,943 bacterial genomes.
    ]
  )
]




// Manishas's 

// Manisha's spreadsheet 
// is strictly a superset of what the API reports as observed.
// The spreadsheet is a strict superset: there is not a single genome where the API reports an observed term the spreadsheet omits, and not one two-way conflict. Everything the spreadsheet does differently, it does by adding. That's worth knowing, because it means the sheet isn't wrong in the usual sense — it's over-confident.

#slide[
  // = Up to this September 
  = Starting point (Oct 2026)
  #set text(0.5em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 1.2em,
    [
      #titled-block(title: [What we had])[
        - *Genomes:* 8,658 high-quality BacDive genomes (HQ dataset)
        - *Labels:* Manisha's phenotype rule on BacDive oxygen terms \
          → facultative (F) vs non-facultative
        - *Features:* 
        132 marker genes (presence/absence), 
        #text(fill: rgb(255, 0, 0))[selected based on?]
        :
          - O#sub[2] defence: _sod_, _kat_, _ahpC_, _rbr_, _sor_, …
          - aerobic respiration: _cox_, _cyo_, _cyd_, _cco_
          - fermentation: _ldh_, _adh_, _pfl_, _pta_/_ack_, butyrate
          - anaerobic respir.: _nar_, _nap_, _nir_, _frd_, _tor_, _dms_, _dsr_
          - regulators: _fnr_, _arcAB_, _narLP_, _oxyR_, _soxRS_
        - *Model:* XGBoost
      ]
    ],
    [
      #titled-block(title: [First results])[
        - High-confidence set: *959 facultative vs 353 non-facultative* \
          → biased towards facultatives
        - Recall: 92.2% facultative, 85.6% non-facultative
        - Most errors were facultatives *without* the classic
          anaerobic-growth markers (NrdD, PFL)
        - Testing MiST signal-transduction features
      ]
      #titled-block(title: [Open issues])[
        - Labels mixed observed BacDive terms with *genome-based predictions*
        - Hyperparameters were tuned on all labels, and early stopping leaked → scores too optimistic
        - No check of labels against the literature
      ]
    ],
  )
]

// ~~~~~
//  THE DATA  — genomes, labels, train/test
//  Numbers from the oxyflex repo (docs/01-data.md, 02-labels.md, 03-model.md,
//  06-three-class.md, results/models/training_labels_M.tsv,
//  results/three_class/{labels,summary,sure_hrgm_summary}.tsv), 19 Nov 2026.
// ~~~~~

// one row of the filtering funnel: count on the left, what it is on the right
#let frow(n, what, note) = (
  text(weight: "bold", size: 1.15em, fill: accent, n),
  [#what #linebreak() #text(size: 0.8em, fill: luma(125), note)],
)

// Genomes
#slide[
  = The genomes
  #set text(0.42em)
  #grid(
    columns: (1fr, 1.05fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [BacDive — where the model learns])[
        *8,658* high-quality genomes whose species has an oxygen record \
        #text(size: 0.9em, fill: luma(125))[2,198 genera · 556 families · 6,950 species]
      ]
      #titled-block(title: [HRGM v2 — where it is applied])[
        *4,824* human-gut species clusters \
        #text(size: 0.9em, fill: luma(125))[709 isolates · 4,115 MAGs · #sym.gt.eq 90% complete, < 5% contaminated]
        #v(0.2em)
        The model never trains on these.
      ]
      #titled-block(title: [264 features])[
        213 Pfam domains + 51 KEGG orthologs, *presence/absence only* \
        #text(size: 0.9em, fill: luma(125))[taken from published oxygen gene sets — never learned from our labels]
      ]
    ],
    [
      #titled-block(title: [BacDive #sym.arrow.r training set])[
        #grid(
          columns: (auto, 1fr),
          column-gutter: 0.8em,
          row-gutter: 0.6em,
          align: (right + horizon, left + horizon),
          ..frow([8,658], [genomes with an oxygen record], [the HQ dataset]),
          ..frow([7,486], [with a usable label], [1,172 records too ambiguous to label]),
          ..frow([1,730], [facultative], [23.1% of the training set]),
          ..frow([5,756], [non-facultative], [aerobes and anaerobes pooled — 3.3 : 1]),
        )
      ]
      #v(0.2em)
      #text(size: 0.9em, fill: luma(120))[
        Copy numbers, pathway-level features and MiST signal-transduction
        composition were all tested and dropped — the 264 have not changed since,
        so every model here is comparable to every other.
      ]
    ],
  )
]

// --- Figure: who wrote the BacDive term ------------------------------
// figs/term_provenance.svg, from figs/make_figs.py <- oxyflex
// results/label_overview/term_provenance.tsv
#slide[
  = Who actually wrote the label?
  #set text(0.4em)
  #align(center, image("figs/term_provenance.svg", width: 79%))
  #v(0.15em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.9em,
    align: top,
    [
      *What I see* \
      The *vague* terms are human — `aerobe` 84% observed, `anaerobe` 76%.
      The *decisive* ones are machine: 70% / 69% / 57% predicted.
      Microaerophile and aerotolerant: *never* predicted.
    ],
    [
      *What I think it means* \
      Backwards from what we need. *7,523 of 18,154 term records* here are
      predictions BacDive stores. Train on the spreadsheet and you learn
      another model. *M reads the blue side only.*
    ],
    [
      #text(fill: luma(100))[
        *Caveat* \
        BacDive's predictions, not ours, and probably decent — the objection is
        circularity, not accuracy. 2,671 pairs are both observed and predicted,
        so they appear twice.
      ]
    ],
  )
]

// Facultatives' definitions
#slide[
  = What is a facultative
  #set text(0.4em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.1em,
    align: top,
    titled-block(title: [Model M — facultative, yes or no])[
      *Positive evidence only.* Observed facultative term #sym.arrow.r 1,
      obligate term #sym.arrow.r 0, a bare `aerobe` or `anaerobe`
      #sym.arrow.r *0, not 1*, microaerophile or aerotolerant alone
      #sym.arrow.r no label.
      #v(0.2em)
      *7,486* genomes #sym.dot.c *1,730* facultative (23.1%) #sym.dot.c 5,756 not
    ],
    titled-block(title: [Three classes — the framing we actually want])[
      *Obligate aerobe / in between / obligate anaerobe*, after Morris &
      Schmidt (2013). "In between" is everything *not obligate either way* —
      microaerophiles and aerotolerant anaerobes included, rather than forced
      onto the side that fits worst.
      #v(0.2em)
      *7,906* genomes #sym.dot.c 3,936 #sym.dot.c *2,422 in between* #sym.dot.c 1,548
    ],
  )

  #v(0.25em)
  #table(
    columns: (1.5fr, auto, auto, 1.6fr),
    align: (left + horizon, center + horizon, right + horizon, left + horizon),
    inset: (x: 0.5em, y: 0.42em),
    stroke: (x, y) => (
      top: if y == 0 { 0pt } else { 0.5pt + luma(220) },
      bottom: if y == 0 { 1pt + accent } else { 0pt },
    ),
    fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
    table.header(
      text(weight: "bold", fill: accent)[Where M's label comes from],
      text(weight: "bold", fill: accent)[Class],
      text(weight: "bold", fill: accent)[Genomes],
      text(weight: "bold", fill: accent)[Why],
    ),
    [observed BacDive term],        [either],            [2,939], [the term decides it outright],
    [only observed term: `aerobe`], [non-facultative],   [2,671], [incomplete record, read conservatively],
    [only observed term: `anaerobe`], [non-facultative], [1,549], [same],
    [curated by us],                [either],            [327],   [4.4% — next slide],
  )

  // #v(0.25em)
  // #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
  //   *Both schemes read a bare "aerobe" conservatively — only one of them says so.*
  //   Those 2,671 + 1,549 = *4,220 genomes* are what a phenotype definition would leave
  //   undecided. The three-class labels flag every genome whose obligate class rests on an
  //   explicit "obligate ..." term and re-score on those alone: *3,806 genomes*, macro AUC
  //   *0.938* against 0.951 on all of them.
  //   #v(0.1em)
  //   #text(size: 0.9em)[M hedges differently: 391 bare-`aerobe` genomes in genera the literature
  //   calls facultative or variable are dropped rather than labelled 0.]
  // ]
]

// Labels fixes
#slide[
  = Fixing the labels
  #set text(0.42em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [First: throw out the predictions])[
        BacDive's oxygen field mixes curated observations with another model's
        predictions (deepG). Training on those means learning someone else's model.
        #v(0.25em)
        Observed terms only #sym.arrow.r
        - *1,950* non-facultative labels rested on a *predicted* "obligate aerobe"
        - *100* facultative labels rested on a predicted term alone
        - *579* ambiguous genomes become clean facultatives
        #v(0.2em)
        // #text(fill: luma(110))[*Measured, at a fixed BacDive snapshot: #sym.plus.minus
        // 0.001 AUC.* It buys non-circularity, not accuracy.]
      ]
      #titled-block(title: [A label belongs to the species])[
        Per-accession decisions left 13 species training on both answers at once
        (14 _P. aeruginosa_ genomes facultative, 2 not). Verdicts now propagate
        across the species — *7 species still split* and need a human.
      ]
    ],
    [
      #titled-block(title: [401 curated labels, five routes in])[
        #set text(0.95em)
        #table(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          inset: (x: 0.4em, y: 0.34em),
          stroke: (x, y) => (top: if y == 0 { 0pt } else { 0.4pt + luma(225) }, bottom: 0pt),
          [literature check + held-out score], [114],
          [anaerobic respirers], [67],
          [denitrifier rule (KEGG M00529 #sym.gt.eq 0.8 + logic gate)], [59],
          [manual checks from species descriptions], [53],
          [strong BacDive term elsewhere in the species], [34],
        )
        #v(0.2em)
        #text(size: 0.9em, fill: luma(120))[327 of them land in the training set — 4.4% of its labels.]
      ]
      #box(width: 100%, inset: 0.55em, radius: 6pt, fill: rgb("#f5e6b8"))[
        *Why this cannot be automated away:* _Pseudomonas aeruginosa_ is a
        denitrifier that grows anaerobically on nitrate, and *all 23 of its
        BacDive records say `aerobe, obligate aerobe`* — observed and predicted
        alike. No care with BacDive's own data finds it.
      ]
    ],
  )
]

// --- The roster of fitted models --------------------------------------
// results/models/superseded/README.md ; docs/02-labels.md ; docs/history.md
// results/observed_labels/summary.tsv ; results/three_class/summary.tsv
#slide[
  = Thirteen training sets, one feature set
  #set text(0.35em)
  #grid(
    columns: (1.45fr, 1fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [One line of descent, and it is all about labels])[
        #set text(0.95em)
        #table(
          columns: (auto, 1.25fr, 1.5fr),
          align: (left + horizon, left + horizon, left + horizon),
          inset: (x: 0.4em, y: 0.34em),
          stroke: (x, y) => (
            top: if y == 0 { 0pt } else { 0.5pt + luma(222) },
            bottom: if y == 0 { 1pt + accent } else { 0pt },
          ),
          fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
          table.header(
            text(weight: "bold", fill: accent)[],
            text(weight: "bold", fill: accent)[What changed in the labels],
            text(weight: "bold", fill: accent)[What happened],
          ),
          [*E*], [tier-1 corrections + the 1,222 bare-`anaerobe` genomes],
            [caught only *34%* of anaerobic respirers when held out],
          [*G*], [#sym.plus 62 anaerobic respirers relabelled facultative],
            [fine; superseded by J's curation],
          [*I*], [#sym.plus 580 O#sub[2]-surviving anaerobes, picked by a *gene rule*],
            [*right category, wrong evidence* #sym.dash.en 42% of HRGM facultative
             (G: 10%), on Fe-SOD],
          [*J*], [G + 197 curated relabels, 12 drops],
            [still read BacDive's *predicted* terms],
          [*K*], [observed terms only], [#text(fill: luma(115))[the control for J]],
          [*L*], [K, and a bare `aerobe` is not a label], [#text(fill: luma(115))[the control for K]],
          [*M*], [L + the literature curation], [*shipped*],
        )
      ]
      #v(0.2em)
      #text(size: 0.9em, fill: luma(120))[
        *A#sym.dash.en#h(0pt)M, thirteen sets in all*; the seven that changed the
        answer are shown. Same *264* presence/absence features and the same grouped
        folds throughout #sym.dash.en only the labels move.
        #v(0.2em)
        *On I.* Our definition #sym.dash.en facultative = found both ways, *growing or
        merely surviving* #sym.dash.en still stands, and by it those 580 anaerobes do
        qualify. What failed was identifying them *from gene content* and then training
        a gene-content model on the result: circular, and in the gut it fired on Fe-SOD,
        which nearly every anaerobe carries. They belong in a *survival axis reported
        beside the call*, not in the training labels.
      ]
    ],
    [
      #titled-block(title: [And the choice between them is not visible in the score])[
        #set text(0.95em)
        #table(
          columns: (auto, auto, auto, auto),
          align: (left + horizon, right + horizon, right + horizon, right + horizon),
          inset: (x: 0.38em, y: 0.32em),
          stroke: (x, y) => (
            top: if y == 0 { 0pt } else { 0.5pt + luma(222) },
            bottom: if y == 0 { 1pt + accent } else { 0pt },
          ),
          fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
          table.header(
            text(weight: "bold", fill: accent)[Genus held out],
            text(weight: "bold", fill: accent)[AUC],
            text(weight: "bold", fill: accent)[SD],
            text(weight: "bold", fill: accent)[Brier],
          ),
          [J], [0.968], [0.018], [0.062],
          [K], [0.960], [0.024], [0.088],
          [L], [0.962], [0.019], [0.077],
          [*M*], [*0.965*], [*0.014*], [*0.073*],
        )
        #v(0.15em)
        *0.008 AUC* separates the four #sym.dash.en inside one fold's SD. M is picked
        for *where its labels come from*; what it wins on is *stability and
        calibration*.
      ]
      #v(0.2em)
      #titled-block(title: [Three lines running beside it])[
        *Three classes* #sym.dash.en obligate aerobe / in between / obligate anaerobe,
        macro AUC 0.951. All 1,730 of M's facultatives fall in the middle group, *named
        instead of split*. \
        *Two capacities* #sym.dash.en `without_o2` and `with_o2` apart. One works; one
        does not. \
        *A rule, no learning in it* #sym.dash.en `logic.py` reads the three capacities
        off the gene content. *A sanity check, never a label source* #sym.dash.en and
        the one thing that scores BacDive: balanced accuracy *0.715* against BacDive,
        *0.872* against the literature.
      ]
    ],
  )
]



// --- Figure: the "anaerobe"-only case --------------------------------
// figs/anaerobe_only.svg, from figs/make_figs.py <- oxyflex
// results/anaerobe_only/pca_scores.tsv (analyses/05_anaerobe_only_pca.py)
#slide[
  = Is "anaerobe" alone enough?
  #set text(0.4em)
  #align(center, image("figs/anaerobe_only.svg", width: 82%))
  #v(0.15em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.9em,
    align: top,
    [
      *What I see* \
      1,222 genomes whose *only* term is `anaerobe`, on the gene-content axis that
      separates known obligate anaerobes from known facultatives.
      *84% land on the anaerobe side* — the known anaerobes manage 91%.
    ],
    [
      *What I think it means* \
      The conservative rule — a bare `anaerobe` is *non-facultative* — is defended
      by gene content, not only by caution. *1,549 training labels rest on it.*
    ],
    [
      #text(fill: luma(100))[
        *Caveat* \
        The same argument does *not* cover a bare `aerobe` — which is why 391 of those
        are dropped instead, and why curation exists. The reference anaerobes are
        only 211 genomes.
      ]
    ],
  )
]


// Training and testing
#slide[
  = Training and testing
  #set text(0.42em)
  #grid(
    columns: (1.05fr, 1fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [There is no held-out test set])[
        5-fold `StratifiedGroupKFold`, and the groups are *taxonomic*.
        Close relatives share most of their genes and their phenotype, so a random
        split would measure lineage recognition, not biology.
        #v(0.25em)
        Three rungs of the same ladder — species, genus, family held out.
      ]
      #v(0.2em)
      #table(
        columns: (1fr, auto, auto),
        align: (left + horizon, right + horizon, right + horizon),
        inset: (x: 0.5em, y: 0.42em),
        stroke: (x, y) => (
          top: if y == 0 { 0pt } else { 0.5pt + luma(220) },
          bottom: if y == 0 { 1pt + accent } else { 0pt },
        ),
        fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
        table.header(
          text(weight: "bold", fill: accent)[Held out],
          text(weight: "bold", fill: accent)[AUC],
          text(weight: "bold", fill: accent)[SD over 5 folds],
        ),
        [species], [0.972], [0.002],
        [genus],   [0.965], [0.014],
        [family],  [0.947], [0.036],
      )
      #v(0.2em)
      #text(size: 0.9em, fill: luma(120))[
        Facultative vs. anaerobe is near-solved (0.99); vs. aerobe is the hard part (0.96).
      ]
    ],
    [
      #titled-block(title: [No peeking])[
        - Hyperparameters *and* the decision threshold come from an *inner* CV
          inside each training fold, grouped by genus on every rung
        - The test fold is only ever scored
        - Class imbalance (3.3 : 1) handled by balanced sample weights
        - Shipped threshold *0.44* raw, *0.296* calibrated — the same call in
          different units
        - Ships with *50 trees*, the median over the genus folds alone
      ]
      #box(width: 100%, inset: 0.55em, radius: 6pt, fill: rgb("#f5e6b8"))[
        *The mean is the reassuring half; the spread is the half that matters.*
        Across the ladder the mean moves 0.025 — it is reading biology, not lineage.
        But fold-to-fold SD rises *eighteenfold*, 0.002 #sym.arrow.r 0.036: which
        family you draw decides the score.
        #v(0.15em)
        #text(size: 0.9em)[That is the argument for a per-genome support column
        instead of a better headline number.]
      ]
    ],
  )
]




// --- Sensitivity: the UBA660 case ------------------------------------
// results/hrgm/uba660_diagnosis.tsv  (p_M, p_K, p_M_without_UPF0154)
// results/hrgm/M/predictions.tsv     (rank band 437-596)
// results/models/training_labels_M.tsv + feature matrix (UPF0154 by class)

// --- The ceiling: negative results ------------------------------------
// docs/07-ceiling.md ; results/error_analysis/M/ceiling_checks.tsv
#slide[
  = Seven things that should have helped
  #set text(0.37em)
  #grid(
    columns: (1.25fr, 1fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [All tested. None of them did.])[
        #set text(0.95em)
        #table(
          columns: (1fr, 1.15fr),
          align: (left + horizon, left + horizon),
          inset: (x: 0.4em, y: 0.36em),
          stroke: (x, y) => (
            top: if y == 0 { 0pt } else { 0.5pt + luma(222) },
            bottom: if y == 0 { 1pt + accent } else { 0pt },
          ),
          fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
          table.header(
            text(weight: "bold", fill: accent)[Idea],
            text(weight: "bold", fill: accent)[Outcome],
          ),
          [MiST signal-transduction composition], [nothing over Pfam/KO],
          [gene copy numbers], [lose to presence/absence],
          [pathway-level features], [0.94 alone, no gain in the set],
          [genome size / small genomes], [#sym.rho = 0.074, pseudo-R#super[2] 0.006],
          [132 curated marker genes], [0.934 against *0.951*],
          [genome incompleteness], [HRGM completeness is 98.0%],
          [calibration], [ECE 0.098 #sym.arrow.r 0.013, *zero calls* changed],
        )
      ]
      #v(0.2em)
      #text(size: 0.9em, fill: luma(120))[
        The small-genome worry runs *backwards*: recall on true facultatives is
        *0.994* for genomes carrying 97 of the 264 features and *0.667* for those
        carrying 172. The hard band is the middle #sym.dash.en which is where most
        of the training data sits.
      ]
    ],
    [
      #titled-block(title: [The one thing that does predict error])[
        Whether the lineage has relatives in training. Inside the same
        cross-validation, splitting the evaluation genomes on what the *family*
        contributed while the genus was held out:
        #v(0.2em)
        #set text(0.95em)
        #table(
          columns: (1fr, auto, auto),
          align: (left + horizon, right + horizon, right + horizon),
          inset: (x: 0.4em, y: 0.36em),
          stroke: (x, y) => (top: if y == 0 { 0pt } else { 0.5pt + luma(222) }, bottom: 0pt),
          text(size: 0.9em, fill: luma(110))[other genera available],
          text(size: 0.9em, fill: luma(110))[facultatives],
          text(size: 0.9em, fill: luma(110))[missed],
          [at most one], [97], [*41.2%*],
          [two or more], [723], [*9.1%*],
        )
        #v(0.15em)
        One relative is no better than none #sym.dash.en the benefit appears only
        at two. *The unit is genera, not genomes.*
      ]
      #v(0.2em)
      #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
        *That is a property of the training set's coverage*, and no choice of
        features, thresholds, calibration or algorithm touches it. Improving the
        predictor means *more genera, from organisms somebody has actually grown.*
        For the uncultured third of the gut catalogue that evidence does not exist
        to be had.
      ]
    ],
  )
]


// --- The gut result ---------------------------------------------------
// docs/05-gut.md ; results/final/hrgm_calls.tsv
#slide[
  = So what is in the gut?
  #set text(0.37em)
  #grid(
    columns: (1fr, 1.3fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [M on the 4,824 HRGM v2 species clusters])[
        #set text(0.95em)
        #table(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          inset: (x: 0.45em, y: 0.4em),
          stroke: (x, y) => (
            top: if y == 0 { 0pt } else { 0.5pt + luma(222) },
            bottom: if y == 0 { 1pt + accent } else { 0pt },
          ),
          fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
          table.header(
            text(weight: "bold", fill: accent)[Call],
            text(weight: "bold", fill: accent)[Clusters],
          ),
          [anaerobe], [4,140],
          [*facultative*], [*596*],
          [aerobe], [88],
        )
        #v(0.15em)
        Mostly Firmicutes (318) and Proteobacteria (183) #sym.dash.en which is what
        a gut catalogue should look like. *That is the easy part.*
      ]
      #v(0.2em)
      #titled-block(title: [Two other routes land in the same place])[
        BacDive-AI, sharing *no features and no labels* with ours, is compatible on
        *92.6%* of clusters; the three-class model puts *10#sym.dash.en#h(0pt)12%* in
        its middle group against M's 12.4%. \
        #text(fill: luma(115))[Neither of them rescues RF39.]
      ]
    ],
    [
      #titled-block(title: [Every gut call is an extrapolation #sym.dash.em so the catalogue ships with a `support` column])[
        Training genomes are environmental, median 4.1 Mbp; HRGM's are gut genomes
        at 2.3 Mbp. A missing gene pushes a call towards non-facultative, so thin
        support shows up as *silent anaerobe defaults*, not as loud false positives.
        #v(0.2em)
        #set text(0.95em)
        #table(
          columns: (1fr, auto, auto),
          align: (left + horizon, right + horizon, right + horizon),
          inset: (x: 0.4em, y: 0.36em),
          stroke: (x, y) => (
            top: if y == 0 { 0pt } else { 0.5pt + luma(222) },
            bottom: if y == 0 { 1pt + accent } else { 0pt },
          ),
          fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
          table.header(
            text(weight: "bold", fill: accent)[`support`],
            text(weight: "bold", fill: accent)[clusters],
            text(weight: "bold", fill: accent)[facultative],
          ),
          [genus in training], [2,170], [362 (16.7%)],
          [family, 2+ genera], [1,106], [110 (9.9%)],
          [*weak*], [*1,548*], [*124 (8.0%)*],
        )
        #v(0.15em)
        *The weak band's 8% is not reassurance.* 87 of those 124 are `f__UBA660`
        alone. Take it out and the weak band is *37 in 1,430 #sym.dash.em 2.6%*,
        against 16.7% where the genus is known.
      ]
    ],
  )
  #v(0.3em)
  #grid(
    columns: (1fr, 1.25fr),
    column-gutter: 1em,
    align: top,
    [
      *Treat with caution* \
      #sym.dot.c Clostridia: *3 facultative of 1,852* #sym.dash.en all 448 in BacDive
      are non-facultative, so the model has never seen one \
      #sym.dot.c MAGs 9.2% against isolates 30.5% \
      #sym.dot.c 307 clusters sit between 0.3 and 0.7
    ],
    box(width: 100%, inset: 0.55em, radius: 6pt, fill: rgb("#f5e6b8"))[
      *And the errors point the wrong way.* On the BacDive folds M misses *106
      facultatives* while over-calling *90* aerobes. For a project that would rather
      have a false positive, that is backwards #sym.dash.en a direct consequence of
      cutting at the balanced-accuracy optimum. *A recall-first threshold costs
      nothing and has not been chosen.*
    ],
  )
]





#divider([Why using Claude is always not a good idea], [lessons learnt by trying to vib])

#slide[
  #set text(0.9em)
  = _"but there are some things it's doing well"_

  #set text(0.8em)
  - creating fuzz
  - not learning your data
  - the code being produced is not something you are familiar with, as a result, in projects like this, you struggle figuring out _what is what_, *even when you do read the code* 
  - if you're about to do something a second time at some point, it will take you longer overall


]




// =====================================================================
//  PROJECT 2  — Metabolic interaction indices 
// =====================================================================
#divider([Metabolic interactions indices], [ideas for what to do with our so-far studying])


// scope chips, so each index says at a glance what it is a score *of*
#let sc-comm = chip([community], accent)
#let sc-pair = chip([pairwise], rgb("#2e7d32"))
#let sc-met  = chip([per metabolite], rgb("#c08a00"))
#let inp(body) = text(fill: luma(110))[*Input* #body]

#slide[
  = What have we studied so-far
  #set text(0.46em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1em,
    align: top,
    titled-block(title: [MW-score #sym.dash.em METABOLIC])[
      #sc-comm #sc-met
      #v(0.3em)
      Metabolic weight score. A proxy of metabolic interactions, *especially
      sequential ones*: knowing what taxa may support a certain step of a
      biogeochemical cycle, and what taxa the following one, you can assume a
      certain interaction between the two sets.
      #v(0.3em)
      #inp[ genome annotations (`.faa`) or MAGs (`.fasta`) for METABOLIC-G;
        paired-end metagenomic reads (`.fastq`) for METABOLIC-C ]
    ],
    titled-block(title: [Competition + Complementarity #sym.dash.em microbetag])[
      #sc-pair
      #v(0.3em)
      Metabolic Competition Index and Metabolic Complementarity Index. A
      *direct score for pairwise cases*, built on the seed and non-seed
      metabolites of two species: the overlap between what a species may take
      from its environment and what it can release.
      #v(0.3em)
      #inp[ GEMs ] \
      #text(fill: luma(110))[Latest implementation of the methods.]
    ],
    titled-block(title: [MIP, MRO #sym.dash.em SMETANA])[
      #sc-pair #sc-comm
      #v(0.3em)
      *MRO* #sym.dash.en Metabolic Resource Overlap: how much the species
      compete for the same metabolites. \
      *MIP* #sym.dash.en Metabolic Interaction Potential: how many metabolites
      the species can share to decrease their dependency on external resources.
      #v(0.3em)
      #inp[ GEMs ] \
      // #text(fill: luma(110))[iNAP also allegedly supports it, but is not open-source.]
    ],
  )
]

#slide[
  = Two more scores, no package
  #set text(0.46em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    align: top,
    titled-block(title: [MES #sym.dash.em no stand-alone library])[
      #sc-met
      #v(0.3em)
      Metabolite Exchange Score. MESSI gives a _score for each individual
      metabolite_, from the balance between the number of species producing it
      and the number consuming it within a given sample. *So, not pairwise.*
      #v(0.3em)
      *The least reproducible approach so far.* Jump to Zenodo
      #link("https://zenodo.org/records/8223163")[zenodo.org/records/8223163],
      get `Marcelino_etal_MES_scripts.zip`, decompress it, and follow somehow
      the lead of the scripts in the `Differences_in_MES` folder.
    ],
    titled-block(title: [PCPS, PCMS #sym.dash.em no direct implementation either])[
      #sc-pair
      #v(0.3em)
      Potential Competition and Potential Cooperation Scores. First you need
      two kinds of media:
      #v(0.2em)
      #sym.dot.c *COMPM* #sym.dash.en competition-inducing medium \
      #sym.dot.c *COOPM* #sym.dash.en cooperation-inducing medium
      #v(0.2em)
      and for those there is
      #link("https://github.com/MSBIDynamics/ncmw/tree/main")[MSBIDynamics/ncmw].
      #v(0.3em)
      Yet it looks like there is *no package so far to calculate the actual
      scores.*

      #inp[GEMs]
    ],
  )
]





// ---------------------------------------------------------------------
//  Framing slide — what the indices actually measure.
//  Fundamental vs realized niche: Hutchinson.
//  Seed-set indices: Levy & Borenstein 2013 PNAS.
//  COMPM / COOPM: Freilich et al. 2011 Nat Commun (check the lineage).
// ---------------------------------------------------------------------
#slide[
  = But what do they actually count for?
  #set text(0.4em)
  These scores *do not* measure metabolic interactions. They measure the
  *compatibility of two reconstructed networks*, with two inference steps in
  between: genome #sym.arrow.r network (annotation, gap-filling) and network
  #sym.arrow.r behaviour (expression, regulation, who is next to whom).
  What separates them is *which environment each one quietly assumes* — and that
  assumption does most of the work.
  #v(0.35em)
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 0.8em,
    align: top,
    titled-block(title: [No environment])[
      #text(fill: accent)[*Competition + Complementarity*] \
      Purely topological. A seed compound is one the network cannot make, so it
      must come from outside — but "outside" is never specified. A statement
      about graph structure.
    ],
    titled-block(title: [A derived environment])[
      #text(fill: accent)[*MIP, MRO*] \
      A minimal medium is computed first: how much do they want the same things,
      how much can the community supply itself. Potential *to grow*, which is
      not potential to interact.
    ],
    titled-block(title: [A designed environment])[
      #text(fill: accent)[*PCPS, PCMS*] \
      COMPM and COOPM are built to *force* competition or cooperation. So these
      measure the extremes — best case and worst case, not the typical one.
    ],
    titled-block(title: [The sample's own community])[
      #text(fill: accent)[*MW-score, MES*] \
      The only two that use who is actually there, and in what abundance. Still,
      producer and consumer are themselves *predicted from genomes*.
    ],
  )
  #v(0.3em)
  #set text(0.86em)
  #grid(
    columns: (1.15fr, 1fr),
    column-gutter: 1em,
    align: top,
    [
      *Fundamental, not realized.* They compute niche overlap in Hutchinson's
      _fundamental_ sense; what we want is the _realized_ one. Closing that gap
      takes measurement of another kind — isotope labelling, exometabolomics,
      co-culture against monoculture, transcriptomics.
      #v(0.1em)
      #text(fill: luma(110))[The two that use real community data are the two with
      no package behind them.]
    ],
    box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
      *The thread to the next section.* Each treats a metabolic trait as a
      *possession of an organism*, then builds the interaction by combining two
      possessions — the relation assembled from the parts, the environment a given
      medium rather than something the organisms make. MIP comes closest to
      escaping that.
    ],
  )
]


#slide[
  #set text(0.7em)
  = MI-bench: filling the software and interpretation gap 

  #set text(0.7em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1em,
    align: top,
    titled-block(title: [A software toolkit])[
      MetabolicIndex-bench would bring together and develop *implemen-tations* for the above indices.
      #v(0.25em)
      #text(fill: luma(110))[MES and PCPS/PCMS have no
      implementation at all, so that part is *writing* them, not wrapping them.]
    ],
    titled-block(title: [Example cases])[
      Explain what each index actually measures — *what to expect* when running each index.
      #v(0.25em)
      #text(fill: luma(110))[Toy communities where the answer is known by
      construction: an obligate cross-feeder pair, a pure competitor, an
      independent pair, one that is both.]
    ],
    titled-block(title: [A case study])[
      Using a synthetic community such as *OMM#sub[12]*, highlight *what biological insight* one may gain by applying each index 
      #v(0.25em)
      #text(fill: luma(110))[Weiss et al. 2021 already give the measured _in vitro_
      // interaction network, spent-supernatant metabolomics and gapseq models —
      ground truth and models for the same twelve organisms.]
    ],
  )

  #box(width: 100%, inset: 0.55em, radius: 6pt, fill: rgb("#f5e6b8"))[
    *For the indices that use community metabolic models, how do the modelling
    choices affect the index?* 
    Consider changes in the reconstruction pipeline, the gap-filling, the assumed medium, the objective — and if the *ranking of pairs flips*, the
    index is a property of our choices, not of the organisms.
  ]

  #titled-block(title: "What do you think?", [
    #emoji.excl #emoji.lightbulb Anybody interested in this?
  ])
]



// =====================================================================
//  PROJECT 3  — dialectics on microb. communities.
// =====================================================================
#divider(
  [dialectics of microbial communities], [
    applying principles of dialectics on microbial communities 
  ]
)

// --- What dialectics claims ------------------------------------------
// For an audience that has never met the term. One law, one microbial
// example, each time. These three are Engels' (Dialectics of Nature,
// 1883) — Levins & Lewontin give four principles instead, next slide.
#slide[
  = Principles, not laws
  #set text(0.48em)

  _"Dialectics is nothing more than *the science of the general laws* of motion and development of nature, human society and thought."_ --  *Engels*, Anti-Dühring.

  // #text(fill: accent)[An example and an analogy: ]\
  // _there cannot be a slave without a master_ -> _there cannot be an auxotroph without a donor_ 
  // // its opposite;  dependency on the other and in a unity of their opposites.


  #titled-block(title: [The Transformation of Quantity into Quality])[
    Continuous change accumulates — and then an entity under study, _becomes_ a *different one*. \
    // #text(fill: accent)[Here:] 

  ]

  #titled-block(title: [The Unity and Struggle of Opposites])[
    An entity carries its own contradictions, and it is these contradiction that move/change it. \
    // #text(fill: accent)[Here:] a facultative anaerobe is an aerobe *and* an anaerobe at once;
    // O#sub[2] is resource and poison in the same cell on the same afternoon. The contradiction
    // is not a defect in our classification — it *is* the organism.
  ]

  #titled-block(title: [The Negation of the Negation])[
    Development is not a circle: 
    what overturns an entity is itself overturned, and something new is left standing one level up. \
    Development that proceeds in spirals, not in a straight line
    // #text(fill: accent)[Here:] an anoxic world #sym.arrow.r cyanobacteria poison it with O#sub[2]
    // #sym.arrow.r respiration turns the poison into the best electron acceptor there is.
    // And today's anaerobes live in micro-niches that aerobes themselves create.
  ]

  #v(0.15em)
  #text(size: 0.9em, fill: luma(120))[
    Not *laws* in terms of predicting, rather *guides* about _where and how to look_:\ 
    at _relations_ rather than things, at _contradictions_ rather than averages, at _processes_ rather than states.
  ]
]

// --------------------------------------------
// 
// #slide[
//   = The giants
//   #set text(0.7em)
//   - *Richard Lewontin*
//   - *Richard Levins* 
//   - *John Maynard Smith* 
//   - *Stephen Jay Gould* #sym.arrow.r  Co-authored the landmark 1979 paper "The Spandrels of San Marco and the Panglossian Paradigm" with Lewontin and shared close intellectual ties with both Lewontin and Levins around dialectical naturalism and anti-adaptationism
//   // - Theodosius Dobzhansky -- practicing Christian
//   - *Elliot Sober* #sym.arrow.r The Nature of Selection (philosopher that jumped into biology)

// ]


// #slide[
//   = On their shoulders
//   #set text(0.4em)
//   #grid(
//     columns: (1fr, 1.05fr),
//     column-gutter: 1.1em,
//     align: top,
//     [
//       #titled-block(title: [Four principles — _The Dialectical Biologist_, "Conclusion: Dialectics"])[
//         + A whole is a *relation of heterogeneous parts* that have no prior,
//           independent existence as parts.
//         + Those parts have no properties of their own either — they *acquire* them
//           by being parts of this particular whole.
//         + Part and whole interpenetrate, because *subject and object, cause and
//           effect, keep changing places*.
//         + Change is a property of every system and of every aspect of it.
//           Nothing is first a thing and then, optionally, in motion.
//       ]
//       #text(size: 0.9em, fill: luma(120))[
//         Levins & Lewontin's target was reductionism: the habit of explaining the
//         whole by taking it apart and assuming the pieces were already what they
//         are before you broke them.
//       ]
//     ],
//     [
//       #titled-block(title: [What it buys a microbiologist])[
//         *The organism as subject and object of evolution.* Bacteria do not adapt
//         to an oxygen gradient — they *build* it. Aerobes drawing O#sub[2] down are
//         what makes the anoxic niche the anaerobes occupy. Niche construction,
//         twenty years before the term.
//         #v(0.2em)
//         *A trait is a relation, not a possession.* A facultative genome on its own
//         is a capacity; in a community it is an oxygen sink, and the community is
//         different for it.
//       ]
//       #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
//         *The uncomfortable part.* OXYFLEX predicts a phenotype from gene content
//         alone — about the most un-dialectical move available. The genes are the
//         *capacity*; the phenotype is the *relation*. Better that I say it than that
//         someone says it to me.
//       ]
//     ],
//   )
// ]

// // Consider having:
// // The fight against Cartesian mode and reductionism -- especially in biology, where molecular goes well but we have nothing new in neural system or embryos


// // The passage you pasted, given its own slide so it stops spilling over.
// #slide[
//   = In their own words
//   #set text(0.5em)
//   #v(1fr)
//   #align(center, block(width: 88%)[
//     #text(style: "italic")[
//       The first principle of a dialectical view, then, is that a whole is a relation of heterogeneous parts that have no prior independent existence as parts. The second principle, which flows from the first, is that, in general, the properties of parts have no prior alienated existence but are acquired by being parts of a particular whole. 
//     ]
//     #v(0.7em)
//     #align(right)[#text(size: 0.82em, fill: luma(115))[
//       Levins & Lewontin, _The Dialectical Biologist_ (1985), "Conclusion: Dialectics"
//     ]]
//   ])
//   #v(1fr)
// ]

// --------------------------------------------


// --- The ask: a reading group ----------------------------------------
#slide[
  = An idea for a book club!
  #set text(0.4em)
  #grid(
    columns: (1fr, 1.25fr),
    column-gutter: 1.1em,
    align: top,
    [

      #titled-block(title: [_The Dialectical Biologist_ — Levins & Lewontin, Harvard UP, 1985])[
        #set text(0.95em)
        - *The Organism as the Subject and Object of Evolution* #sym.dash.em start here
        - *Dialectics and Reductionism in Ecology* #sym.dash.em what a community is
        - *Evolution as Theory and Ideology* / *Adaptation*
        - *The Problem of Lysenkoism* #sym.dash.em the cautionary one: dialectics as
          state dogma, and what it cost
        - *Conclusion: Dialectics* #sym.dash.em the four principles, last
      ]
      
      #titled-block(title: [Why this book])[
        - It discusses *key concepts* of our scientific field.
        - It is a *collection*, not monograph — we can pick, skip and reorder without losing the thread. 
        - My intention is to get a solid understanding of it and try to *translate* it in Greek.
      ]
    ],
    [
      // #titled-block(title: [_Biology Under the Influence_ — Monthly Review Press, 2007])[
      //   #set text(0.95em)
      //   31 shorter essays, many first written as columns. The ones closest to us:
      //   *Organism and Environment* #sym.dot.c *Chance and Necessity* #sym.dot.c
      //   *Does Anything New Ever Happen?* #sym.dot.c *The End of Natural History?*
      // ]
      #titled-block(title: [Details of a probable format])[
        - *One essay per session*, every three-four weeks
        - Ten-minute summary, then free discussion on:  
          - *what were the hard parts to get*, if any, (especially in terms of concepts/terms mentioned)
          - how do we feel on any *examples* mentioned in the essay -- agree/disagree, was it a fair example to actually explain the concept
          - what *other examples* may we find from our own research (or of others that we know of)
      ]

      #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
        To me, this is what I feel my research interests lead me to.
        In case it sounds boring or whatever, it's totally fine and feel free to *save yourselves* from this rabbit hole.
      ]
    ],
  )
]




#slide[
  = Thank you!
  #v(1fr)
  #grid(
    columns: (auto, auto, 1fr),
    column-gutter: 1.2em,
    align: horizon,
    [
      #set text(size: 0.8em)
      Let's now check on what we missed or left for later #emoji.face.smile.sweat \
      #v(1em)
      Any questions, criticism or ideas?  
    ],
  )
  #v(1fr)
]



#slide[
  = SMETANA detailed mode

  #set text(0.7em)

  #sym.dot.c  *SCS (species coupling score):* measures the dependency of one species in the presence of the others to survive

  #sym.dot.c *MUS (metabolite uptake score):* measures how frequently a species needs to uptake a metabolite to survive

  #sym.dot.c *MPS (metabolite production score):* measures the ability of a species to produce a metabolite

  #sym.dot.c *SMETANA:* the individual smetana score is a combination of the 3 scores above, it gives a measure of certainty on a cross-feeding interaction (species A receives metabolite X from species B).
]

#slide[
  = What the scores mean
  #set text(0.4em)

  #let ok  = rgb("#2e7d32")
  #let bad = rgb("#c62828")
  #let cell(tag, gloss, color) = box(
    width: 100%, inset: (x: 0.45em, y: 0.38em), radius: 5pt,
    fill: color.lighten(88%), stroke: 0.6pt + color.lighten(45%),
  )[
    #text(weight: "bold", fill: color.darken(12%))[#tag]
    #linebreak()
    #text(size: 0.8em, fill: luma(95))[#gloss]
  ]
  #let gloss(body) = text(size: 0.85em, fill: luma(115))[#body]

  #grid(
    columns: (1fr, 1.08fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [The four outcomes #sym.dash.em the positive class is _facultative_])[
        #table(
          columns: (auto, 1fr, 1fr),
          stroke: none,
          inset: (x: 0.25em, y: 0.25em),
          align: center + horizon,
          [],
          text(weight: "bold", fill: accent)[called facultative],
          text(weight: "bold", fill: accent)[called not],

          text(weight: "bold", fill: accent)[really \ facultative],
          cell([TP], [caught], ok),
          cell([FN], [a missed facultative], bad),

          text(weight: "bold", fill: accent)[really \ not],
          cell([FP], [an over-called aerobe], bad),
          cell([TN], [left alone], ok),
        )
      ]
      #v(0.35em)
      #titled-block(title: [AUC #sym.dash.em the one that ignores the cut])[
        Sweep the threshold from 1 down to 0 and plot sensitivity against
        $1 - "specificity"$: that curve is the ROC, and the AUC is the area under it.
        #v(0.2em)
        Equivalently #sym.dash.en and more usefully #sym.dash.en it is *the chance that a
        random facultative genome scores above a random non-facultative one*. It never looks
        at where we cut, so it judges the _ranking_, never the calls.
      ]
      #v(0.3em)
      #gloss[Model M, genus held out: AUC *0.965*, sensitivity *0.867*,
      specificity *0.937*, balanced accuracy *0.902*.]
    ],
    [
      #titled-block(title: [The scores that do depend on the cut])[
        $ "sensitivity" = "TP" / ("TP" + "FN") $
        #gloss[of the genomes that really are facultative, the share we catch]
        #v(0.3em)
        $ "specificity" = "TN" / ("TN" + "FP") $
        #gloss[of those that really are not, the share we leave alone]
        #v(0.3em)
        $ "accuracy" = ("TP" + "TN") / ("TP" + "TN" + "FP" + "FN") $
        #v(0.3em)
        $ "balanced accuracy" = ("sensitivity" + "specificity") / 2 $
        #gloss[the mean of the first two, so each class counts once whatever its size]
      ]
      #v(0.3em)
      #box(width: 100%, inset: 0.55em, radius: 6pt, fill: rgb("#f5e6b8"))[
        *Why the balanced one.* Our labels are *3.3 : 1* non-facultative. Call every genome
        non-facultative and plain accuracy is already *77%* #sym.dash.en balanced accuracy
        puts that same do-nothing model back at *50%*.
      ]
    ],
  )
]





// --- Two capacities: the with_o2 failure ------------------------------
// docs/04-capacities.md ; results/capacity_models/summary.tsv
// results/anaerobe_tolerance/{per_genus_holdout,top_features}.tsv
#slide[
  = Tolerance is not use
  #set text(0.37em)
  #grid(
    columns: (1fr, 1.1fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [One word, two abilities])[
        A genome is facultative when it can *grow without oxygen* #sym.dash.en and
        *cope with oxygen*. One model per capacity, same features, same folds.
        Separating them was worth doing because it makes a limit of the whole
        project visible.
      ]
      #v(0.2em)
      #table(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        inset: (x: 0.45em, y: 0.4em),
        stroke: (x, y) => (
          top: if y == 0 { 0pt } else { 0.5pt + luma(220) },
          bottom: if y == 0 { 1pt + accent } else { 0pt },
        ),
        fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
        table.header(
          text(weight: "bold", fill: accent)[Genus held out],
          text(weight: "bold", fill: accent)[AUC],
        ),
        [`without_o2` #sym.dash.en grow without oxygen], [0.962],
        [`with_o2` #sym.dash.en against weak negatives], [0.983],
        [*`with_o2` #sym.dash.en documented O#sub[2]-tolerant \ anaerobes vs other anaerobes*],
          [*0.359*],
      )
      #v(0.2em)
      #text(size: 0.9em, fill: luma(120))[
        0.983 is aerobes against anaerobes, which is easy. Ask the question we
        actually wanted and the model is *below chance* #sym.dash.en it ranks the
        tolerant ones _lower_.
      ]
    ],
    [
      // #titled-block(title: [Why this one cannot be supervised])[
      //   *A "strictly anaerobic" record is not a survival test.* Nobody exposed the
      //   organism to air and reported it died #sym.dash.en the phrase usually means it
      //   was grown anaerobically. The negatives cannot be trusted, so it is trained
      //   *positive-unlabelled*, Elkan#sym.dash.en#h(0pt)Noto $c = 0.87$.
      // ]
      #v(0.2em)
      #titled-block(title: [A dedicated model splits the organisms mechanistically])[
        Trained on anaerobes only, scoring each positive genus with that genus held
        out #sym.dash.en median percentile among anaerobes:
        #v(0.15em)
        *Recovered* #sym.dash.en _Campylobacter_ 0.98, _Akkermansia_ 0.98,
        _Bacteroides_ 0.97, _Porphyromonas_ 0.94 \
        *Missed* #sym.dash.en _Veillonella_ 0.76, _Neomoorella_ 0.66
        #v(0.15em)
        Its top feature is `DoxX`: 94% of the positives, 27% of the rest.
      ]
    ],
  )
  #v(0.3em)
  #box(width: 100%, inset: 0.55em, radius: 6pt, fill: rgb("#f5e6b8"))[
    *The split is mechanistic, not statistical.* This feature set finds the organisms
    that defend themselves the way its positives do #sym.dash.en the cytochrome _bd_
    route. More trees will not fix it; documented positives outside the Bacteroidota,
    and features for the other defences (Mn catalase, NADH oxidase/peroxidase,
    rubrerythrin), might. *So it ships as a ranked candidate list, not a call* #sym.dash.en
    and it does not overturn M: the capacity models put *751 of the 862 facultatives*
    among M's evaluation genomes in the "both" group.
  ]
]



// --- Three classes: the second modelling line -------------------------
#slide[
  = Three classes instead of two
  #set text(0.4em)
  #grid(
    columns: (1.15fr, 1fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [The extremes first, the middle after])[
        One binary label forces microaerophiles, aerotolerant anaerobes and
        nanaerobes onto whichever side fits worst. Same features, same folds,
        three classes instead — genus held out.
      ]
      #v(0.2em)
      #table(
        columns: (1.4fr, auto, auto, auto),
        align: (left + horizon, right + horizon, right + horizon, right + horizon),
        inset: (x: 0.45em, y: 0.4em),
        stroke: (x, y) => (
          top: if y == 0 { 0pt } else { 0.5pt + luma(220) },
          bottom: if y == 0 { 1pt + accent } else { 0pt },
        ),
        fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
        table.header(
          text(weight: "bold", fill: accent)[Feature set],
          text(weight: "bold", fill: accent)[Macro AUC],
          text(weight: "bold", fill: accent)[Bal. acc.],
          text(weight: "bold", fill: accent)[In between],
        ),
        [*264 Pfam/KO of model M*], [*0.951*], [*0.877*], [*0.911*],
        [132 markers + sure Pfam/KO], [0.947], [0.866], [0.904],
        [group-level presence], [0.940], [0.857], [0.893],
        [132 marker genes only], [0.934], [0.844], [0.889],
      )
      #v(0.2em)
      #text(size: 0.9em, fill: luma(120))[
        Obligate anaerobes are nearly solved (0.98–0.99). *"In between" is the hard
        class* — the same difficulty as the binary model, relocated to a class that
        is now named honestly.
      ]
    ],
    [
      #titled-block(title: [The marker genes did not win])[
        The 132 curated marker genes were the reason for this line. They lose to
        the 264 published-gene-list features on every comparison — 0.934 against
        *0.951* — and the ordering holds on explicit labels only.
        #v(0.15em)
        #text(size: 0.9em, fill: luma(120))[A curated feature set does not beat a broader one.
        Worth knowing before anyone curates more genes.]
      ]
      #titled-block(title: [Three routes agree about the gut])[
        #set text(0.95em)
        #table(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          inset: (x: 0.4em, y: 0.34em),
          stroke: (x, y) => (top: if y == 0 { 0pt } else { 0.4pt + luma(225) }, bottom: 0pt),
          [three-class, "sure" Pfam/KO], [471 (9.8%)],
          [three-class, KO-derived genes], [585 (12.1%)],
          [model M, binary], [596 (12.4%)],
        )
        #v(0.15em)
        #text(size: 0.9em, fill: luma(120))[Two label schemes, two feature sets, one answer:
        *10–12% of the 4,824 gut clusters are neither obligate*.]
      ]
      #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
        *Not finished.* The second round — telling a microaerophile from a
        facultative anaerobe *inside* the middle group — has not been attempted.
      ]
    ],
  )
]




#slide[
  = How much does one gene carry?
  #set text(0.37em)
  #grid(
    columns: (1fr, 1.12fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [A family the model has never met])[
        `f__UBA660` #sym.dash.en order *RF39*, class Bacilli #sym.dash.en is *118 of
        the 4,824 gut clusters*, and *every one is a MAG*. The order has no cultured
        representative, so *not one training genome is a relative*. Median *72 of the
        264 features* present, against 108 elsewhere.
      ]
      #v(0.2em)
      #table(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        inset: (x: 0.5em, y: 0.42em),
        stroke: (x, y) => (
          top: if y == 0 { 0pt } else { 0.5pt + luma(220) },
          bottom: if y == 0 { 1pt + accent } else { 0pt },
        ),
        fill: (x, y) => if y != 0 and calc.even(y) { luma(249) },
        table.header(
          text(weight: "bold", fill: accent)[Called facultative],
          text(weight: "bold", fill: accent)[of 118],
        ),
        [*model M as shipped*], [*87*],
        [M with `UPF0154` set to 0, nothing else], [0],
        [label variant K], [0],
        [#text(fill: luma(110))[BacDive-AI says _anaerobe_]], [#text(fill: luma(110))[110]],
      )
      #v(0.2em)
      #text(size: 0.9em, fill: luma(120))[
        Median score 0.516 #sym.arrow.r *0.202* when that one feature is zeroed.
        The threshold is 0.44.
      ]
      #v(0.35em)
      #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
        *No held-out score can see this.* Family held out still draws its families
        from orders that have cultured members; here the whole order is uncultured.
        *87 of M's 596 gut calls rest on one Pfam.* This is what the `support`
        column is for, and RF39 is its one loud case: *strip it and the weak band
        falls to 2.6%*, the rest being quiet anaerobe defaults.
      ]
    ],
    [
      #titled-block(title: [The feature is a clade marker, not an oxygen gene])[
        `UPF0154` is M's *6th most important feature* #sym.dash.en 48.8% of facultative
        training genomes carry it against 9.4% of the rest. Split by lineage, that
        signal disappears:
        #v(0.2em)
        #sym.dot.c present in *96.1% of Bacilli*, *0.6% of everything else* \
        #sym.dot.c inside Bacilli it separates nothing #sym.dash.en *99.5%* of the
        facultatives carry it, and *89.2%* of the non-facultatives \
        #sym.dot.c cultured Bacilli are *66.8% facultative*, everything else 15.7%
        #v(0.2em)
        The rule learnt is *"Bacillus-like #sym.arrow.r facultative"*, applied to an
        uncultured order. Mean SHAP: `UPF0154` *+0.95* against `Rubrerythrin`
        #sym.minus#h(0pt)0.23 #sym.dash.en net logit *+0.034*, p #sym.approx 0.51.
      ]
      #v(0.2em)
      #titled-block(title: [And they all sit on the cut])[
        In M's own ranking only *4* of them reach the top 436 #sym.dash.en but *87*
        reach the top 596. *83 of the 160 clusters in ranks 437#sym.dash.en#h(0pt)596 are this
        one family*: a block that moves together on any small shift of the operating point.
      ]
    ],
  )
]




// --- Closing ask for the OXYFLEX section ------------------------------
// docs/report.md "What would move the numbers" ; docs/05-gut.md ; 07-ceiling.md
#slide[
  #set text(0.8em)
  = Some help would be more than welcome! 
  #set text(0.50em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.1em,
    row-gutter: 0.45em,
    align: top,
    titled-block(title: [1. What do we do about RF39?])[
      87 calls on no taxonomic support, 15% of every facultative call in the gut.
      *Ship an exclusion rule*, or *ship the `support` column* and let the reader
      decide? \
      #text(fill: luma(115))[The model cannot make this call for itself, and an
      exclusion rule is a judgement about what the catalogue is _for_.]
    ],
    titled-block(title: [2. Where do we cut?])[
      The threshold maximises balanced accuracy, and that is why *106 facultatives
      are missed against 90 aerobes over-called*. For a project that would rather
      over-call, this is backwards. \
      #text(fill: luma(115))[Moving it costs nothing and has not been done. What
      should it be optimising?]
    ],
    // titled-block(title: [3. Is the middle group worth finishing?])[
    //   The three-class model names microaerophiles and aerotolerant anaerobes
    //   honestly but does not yet separate them *from each other*. \
    //   #text(fill: luma(115))[That second round is the one modelling direction not
    //   yet exhausted #sym.dash.en and the only one.]
    // ],
    // titled-block(title: [4. Who has the genomes?])[
    //   *More genera from organisms somebody has actually grown* is the only lever
    //   left: 41% of facultatives are missed where the family is thin, 9% where it is
    //   not. \
    //   #text(fill: luma(115))[Not a modelling problem. A collection problem.]
    // ],
  )
  #v(0.3em)
  #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
    *And one that needs a person, not a method.* The genera the model confuses
    #sym.dash.en _Corynebacterium_, _Bacillus_, _Paenibacillus_ #sym.dash.en are the
    same ones whose literature notes are only genus-level. *The label noise and the
    model error are in the same place.*
  ]
  #v(0.2em)
  #align(center)[#text(size: 1.05em)[
    #emoji.excl #emoji.lightbulb *What do you think?* Anybody who works on gut
    anaerobes, or has cultured genomes to spare?
  ]]
]
