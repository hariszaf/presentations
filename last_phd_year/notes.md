## slide 1 

Hello everyone 
I would like to welcome you in my phd defense and to thank you for being here. 

My phd is focusing on how various bioinformatics appproaches can benefit the study of microbial communities. 

## slide 2: contents

This presentation will follow the scheme of my dissertation and I will try to highlight 
how each of its chapters contributes to the community's knowledge 
as well as 
to the key parts for implementing each of the software and studies that were performed. 


## slide 3: microbial ecology in general

In general, microbial communities play a fundamental role in forming the world as we know it. 

Indicatively, microbes in their vast diversity and the proccesses that carry out 
are responsible for the cycles of elements such as carbon and nitrogen.

Different taxa are present in the various environments forming the taxonomic profile of a community
and the sum of the processes that this set of taxa supports is called the functional profile of the community. 

To decipher the underlying mechanisms that govern these microbial assemblages and their role to the ecosystem, 
it is fundamental to study the community in multiple levels: 
    - the taxon 
    - the community 
    - the interactions among them 


## slide 4: main questions

Therefore, among the main questions of most microbial ecology studies is: 
 * the *who*, meaning the inference of the taxa present in an assemblage along with its relative abundance 
 * the *what*, meaning the functional potential of the community 
 * the *why* and *how*, meaning the ways that microbial assemblages are actually structured. Both biological as well as ecological interactions among the taxa present, have a key role to that end.

A great range of theories has been discussed over the years 
about the ways that communities are structured, yet 
microbial ecology has still a lot of open queistions to addres!


<!-- zero-sum game:  the result is an advantage for one side and an equivalent loss for the other; therefore the net improvement in benefit of the game is zero.  -->

## slide 5: reverse ecology 

Traditionally, for studies relating genetics and ecology scientists
first identify an ecological adaptive phenotype and then they try to detect causal genetic variation.

However and thanks to HTS 
it is now possible to reverse this framework and by using the genomic information retrieved, to study the ecology of a species.

The Reverse Ecology framework uses advances in both systems
biology and genomic metabolic modeling to implement community ecology studies with
no a priori assumptions about the organisms under consideration. 

By moving from the taxon to the community level, Reverse Ecology set a new era for the study of microbial exology too. 

However, each and every step of the way described in this figure
comes with a number of challenges. 

## slide 6: challenges

However, to implement a reverese-ecology-based study, 
starting for example from a multi-omic or even a metagenomic sample 
and ending up with the taxa present, their relative abundandce, 
their genomes and thus the functional processes that these taxa 
are able to perform, but even further 
with the metabolic model of each of these taxa and finally with 
a model that integrates the corresponding genome-scale metabolic models of the community, is far from easy! 

On the contrary, each step of the way comes with a great range of challenges; 
certainly, some of those are biology-oriented but there is a also 
a great number of challenges that are strongly related to the 
bioinformatics and the computational aspect of the analysis of the derived data. 


## slide 7: aim of this phd

The aim of this PhD was double:
1. to enhance the analysis of microbiome data by building algorithms and software
that address limitations and on-going computational challenges
2. to exploit state-of-the-art methods to identify taxa and functions that play a key
part in microbial community assemblages in hypersaline sediments.


## slide 8: CHAPTER 1 

So the first challenges I dealt with were about HTS data analysis and most specifically the analysis of metabarcoding data. 

## slide 9: eDNA 

Briefly speaking, environmental DNA metabarcoding is a widely used method for biodiversiy assessment based on a single marker gene that varies based on the taxonomic group of study. 

Based on that marker gene, one may have a quite detailed overview of the biodiversity of a sample from almost any environment. 


## slide 10: challenges in metabarcoding 

The challenges however of the method have a great range 
starting from the sampling procedures to the analysis of the taxa found along with their relative abundances. 

Two of the most common issues that arise when handling
metabarcoding data is the various steps of the 
bioinformatics analysis required to move from the raw sequencing data to a table of taxa along with their relative abundances. 

Multiple tools and databases as well as their continuous versioning makes the analysis challenging especially in terms of FAIRness, meaning to allow to the community to reproduce your analysis in an easy way. 

Another common issue is the presence of sequence reads that in the end of the analysis have not been assigned to a taxon. 
These known unknowns can be novel taxa of the taxonomic groups 
or something quite out-of-scope! 


## slide 11: PEMA contribution 

So, in the first place I developed a workflow aiming at a
easy to use, 
one-stop-shop for the analysis of metabarcoding data. 

And as studies that exploit this approach may range 
from a few to thousands of samples being scalable was also 
among my goals. 

To this end, I developed PEMA. 


## slide 12: PEMA Implementation 


To address the challenges mentioned PEMA takes advantage 






