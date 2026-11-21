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
  = Today's main focus lies on..
  #set text(0.7em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    titled-block(title: [Predicting facultatives])[
      Following Manisha's lead, let's try to agree on some *terms*, 
      check some *findings*, address some *challenges* and come up with 
      *a story to tell*!
      #v(0.3em)
      #text(size: 0.8em, fill: luma(110))[
        updates · open questions
      ]
    ],
    titled-block(title: [Metabolic indices])[
      Based on our so-far journal clubs and study, let's have a quick 
      *overview*, so we can go for a collective *brainstorming* on what we can do next, and how-who!
      #v(0.3em)
      #text(size: 0.8em, fill: luma(110))[benchmarking · when to use · _how-to_]
    ],
  )
  #v(0.5em)
  #titled-block(title:[Philosophy of Biology])[
  An *idea* of mine to bring together the two things I enjoy to study the most -- besides history #emoji.face.smile.sweat .]
]


#slide[
  = But before that, some news!

  #set text(0.63em)
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

// Manishas's 
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
        - *Features:* 132 marker genes (presence/absence), picked by (hand?, one/several papers?):
          - O#sub[2] defence: _sod_, _kat_, _ahpC_, _rbr_, _sor_, …
          - aerobic respiration: _cox_, _cyo_, _cyd_, _cco_
          - fermentation: _ldh_, _adh_, _pfl_, _pta_/_ack_, butyrate
          - anaerobic respiration: _nar_, _nap_, _nir_, _frd_, _tor_, _dms_, _dsr_
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

  #v(0.25em)
  #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
    *Both schemes read a bare "aerobe" conservatively — only one of them says so.*
    Those 2,671 + 1,549 = *4,220 genomes* are what a phenotype definition would leave
    undecided. The three-class labels flag every genome whose obligate class rests on an
    explicit "obligate ..." term and re-score on those alone: *3,806 genomes*, macro AUC
    *0.938* against 0.951 on all of them.
    #v(0.1em)
    #text(size: 0.9em)[M hedges differently: 391 bare-`aerobe` genomes in genera the literature
    calls facultative or variable are dropped rather than labelled 0.]
  ]
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

// --- Figure: the "anaerobe"-only case --------------------------------
// figs/anaerobe_only.svg, from figs/make_figs.py <- oxyflex
// results/anaerobe_only/pca_scores.tsv (analyses/05_anaerobe_only_pca.py)
#slide[
  = "Anaerobe" alone is enough
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
  = here we go
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


// ---------------------------------------------------------------------
//  ORIGINAL SLIDE — your text, kept verbatim. Nothing deleted.
//  Reworked below: the "Moreover" question promoted to the lead.
//
// #slide[
//   = Coming up with a story on that?
//
//   #set text(0.9em)
//   #titled-block(title: "MI-bench", [
//
//     #set text(0.7em)
//     #sym.dot.c A software package bringing together the above indices\
//     #sym.dot.c Example cases for showcasing what each index actually measures; the essential part here would be for people to know what to expect when running an index\
//     #sym.dot.c Use case on a synthetic community (e.g., OMM#sub[12])
//
//     #v(0.1em)
//     Moreover, for the indices that are using community metabolic models, 
//     how does the modeling choices affect the indices? 
//
//   ])
//
//   #set text(0.9em)
//   #titled-block(title: "What do you think?", [
//       #emoji.excl #emoji.lightbulb Anybode interested in this ? 
//   ])
//
// ]
// ---------------------------------------------------------------------
#slide[
  #set text(0.7em)
  = MI-bench: filling the software and interpretation gap 

  #set text(0.7em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1em,
    align: top,
    titled-block(title: [A software toolkit])[
      Bringing together and developing *implementations* for all the above indices.
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
    My long-term research endeavor: \
    applying the laws of dialectics on microbial communities 
  ]
)

// --- What dialectics claims ------------------------------------------
// For an audience that has never met the term. One law, one microbial
// example, each time. These three are Engels' (Dialectics of Nature,
// 1883) — Levins & Lewontin give four principles instead, next slide.
#slide[
  = Principles not laws
  #set text(0.38em)

  _"Dialectics is nothing more than *the science of the general laws* of motion and development of nature, human society and thought."_

  There cannot be a slave without a master -> there cannot be an auxotroph without a donor // its opposite;  dependency on the other and in a unity of their opposites.


  #titled-block(title: [The Transformation of Quantity into Quality])[
    Continuous change accumulates — and then the thing becomes a *different kind of thing*. \
    #text(fill: accent)[Here:] 

  ]

  #titled-block(title: [The Unity and Struggle of Opposites])[
    A thing carries its own contradiction, and that contradiction is what moves it. \
    #text(fill: accent)[Here:] a facultative anaerobe is an aerobe *and* an anaerobe at once;
    O#sub[2] is resource and poison in the same cell on the same afternoon. The contradiction
    is not a defect in our classification — it *is* the organism.
  ]

  #titled-block(title: [The Negation of the Negation])[
    Development is not a circle: what overturns a thing is itself overturned, and something
    new is left standing one level up. \
    #text(fill: accent)[Here:] an anoxic world #sym.arrow.r cyanobacteria poison it with O#sub[2]
    #sym.arrow.r respiration turns the poison into the best electron acceptor there is.
    And today's anaerobes live in micro-niches that aerobes themselves create.
  ]

  #v(0.15em)
  #text(size: 0.9em, fill: luma(120))[
    Not laws that predict anything — instructions about where to look: at relations rather
    than things, at contradictions rather than averages, at processes rather than states.
  ]
]

#slide[
  = The giants
  #set text(0.8em)

  - Richard Lewontin
  - Richard Levins 
  - John Maynard Smith 
  - Stephen Jay Gould -->  Co-authored the landmark 1979 paper "The Spandrels of San Marco and the Panglossian Paradigm" with Lewontin and shared close intellectual ties with both Lewontin and Levins around dialectical naturalism and anti-adaptationism

  // - Theodosius Dobzhansky -- practicing Christian


  - Elliot Sober -- The Nature of Selection (philosopher that jumped into biology)

]


#slide[
  = On their shoulders
  #set text(0.4em)
  #grid(
    columns: (1fr, 1.05fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [Four principles — _The Dialectical Biologist_, "Conclusion: Dialectics"])[
        + A whole is a *relation of heterogeneous parts* that have no prior,
          independent existence as parts.
        + Those parts have no properties of their own either — they *acquire* them
          by being parts of this particular whole.
        + Part and whole interpenetrate, because *subject and object, cause and
          effect, keep changing places*.
        + Change is a property of every system and of every aspect of it.
          Nothing is first a thing and then, optionally, in motion.
      ]
      #text(size: 0.9em, fill: luma(120))[
        Levins & Lewontin's target was reductionism: the habit of explaining the
        whole by taking it apart and assuming the pieces were already what they
        are before you broke them.
      ]
    ],
    [
      #titled-block(title: [What it buys a microbiologist])[
        *The organism as subject and object of evolution.* Bacteria do not adapt
        to an oxygen gradient — they *build* it. Aerobes drawing O#sub[2] down are
        what makes the anoxic niche the anaerobes occupy. Niche construction,
        twenty years before the term.
        #v(0.2em)
        *A trait is a relation, not a possession.* A facultative genome on its own
        is a capacity; in a community it is an oxygen sink, and the community is
        different for it.
      ]
      #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
        *The uncomfortable part.* OXYFLEX predicts a phenotype from gene content
        alone — about the most un-dialectical move available. The genes are the
        *capacity*; the phenotype is the *relation*. Better that I say it than that
        someone says it to me.
      ]
    ],
  )
]
// Consider having:
// The fight against Cartesian mode and reductionism -- especially in biology, where molecular goes well but we have nothing new in neural system or embryos


// The passage you pasted, given its own slide so it stops spilling over.
#slide[
  = In their own words
  #set text(0.5em)
  #v(1fr)
  #align(center, block(width: 88%)[
    #text(style: "italic")[
      The first principle of a dialectical view, then, is that a whole is a relation of heterogeneous parts that have no prior independent existence as parts. The second principle, which flows from the first, is that, in general, the properties of parts have no prior alienated existence but are acquired by being parts of a particular whole. 
    ]
    #v(0.7em)
    #align(right)[#text(size: 0.82em, fill: luma(115))[
      Levins & Lewontin, _The Dialectical Biologist_ (1985), "Conclusion: Dialectics"
    ]]
  ])
  #v(1fr)
]



// --- The ask: a reading group ----------------------------------------
#slide[
  = An idea: a book lab
  #set text(0.4em)
  #grid(
    columns: (1fr, 1.25fr),
    column-gutter: 1.1em,
    align: top,
    [
      #titled-block(title: [The format])[
        - *One essay per session*, every two weeks, 45 minutes
        - One person leads: ten-minute summary, two questions, *no slides*
        - Each essay paired with *one paper from our own field* — the point is
          to argue with it, not to admire it
        - Notes in a shared repo, so a year of this leaves something behind
      ]
      #titled-block(title: [Why these two books])[
        Both are *collections*, not monographs — we can pick, skip and reorder
        without losing the thread. And both were written by working biologists
        about biology, not by philosophers about biologists.
      ]
    ],
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
      #titled-block(title: [_Biology Under the Influence_ — Monthly Review Press, 2007])[
        #set text(0.95em)
        31 shorter essays, many first written as columns. The ones closest to us:
        *Organism and Environment* #sym.dot.c *Chance and Necessity* #sym.dot.c
        *Does Anything New Ever Happen?* #sym.dot.c *The End of Natural History?*
      ]
      #box(width: 100%, inset: 0.5em, radius: 6pt, fill: rgb("#f5e6b8"))[
        *What I am asking for:* four people and a room. If four of you are in, I will
        pick the first essay and send it round.
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