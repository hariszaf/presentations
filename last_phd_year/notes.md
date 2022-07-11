# PhD defense notes

## WELCOME

Hello everyone! 

I would like to welcome you in my phd defense and to thank you for being here. 

My phd is focusing on how various bioinformatics appproaches can benefit the study of microbial communities. 

More specifically, how bioinformatics can contribute in HTS data analysis
as well as in the further exloitation of them thanks to data integration techniques. 

Moreover, even if metabolic modeling has been providing with great insight for over the last 30 years,
it is only recently that has been used at the microbial community level. 

In the next 40' I will try to highlight: 
* how each of my disseration's chapters 
contributes ,as well as 
* the key parts for implementing each of the software and studies that were performed


## INTRODUCTION


### slide 1: microbial ecology in general


Apparently, microbial ecology is the ecology of microorganisms: 
their relationship with one another and with their environment.


In general, microbial communities play a fundamental role in forming the world as we know it. 

Indicatively, microbes in their vast diversity and the proccesses that carry out 
are responsible for the cycles of elements such as carbon and nitrogen.

The study of microbial communities can help us in various ways: 

* to address basic questions about how life originated and how it evolved, 

* to measure the effects of climate change and land usage 

* to improve our lives; environmental restoration, food production, bio-engineering of useful products such as antibiotics, food supplements, and chemicals benefit are achieved thanks to microbes


### slide 2: main questions

Different taxa are present in the various environments forming the taxonomic profile of a community
and the sum of the processes that this set of taxa supports is called the functional profile of the community. 

<!-- To decipher the underlying mechanisms that govern these microbial assemblages and their role to the ecosystem, 
it is fundamental to study the community at both the taxon 
but the community 
* the interactions among them  -->

Therefore, among the main questions of most microbial ecology studies is: 
 * the *who*, meaning the inference of the taxa present in an assemblage along with its relative abundance 
 * the *where*, denoting the environment from where a sample was taken
 * the *what*, meaning the functional potential of the community 
 * and finally, the *how*, meaning the ways that microbial assemblages are actually structured. 
 
 <!-- Both biological as well as ecological interactions among the taxa present, have a key role to that end.
A great range of theories has been discussed over the years 
about the ways that communities are structured, yet 
microbial ecology has still a lot of open queistions to addres! 
zero-sum game:  the result is an advantage for one side and an equivalent loss for the other; therefore the net improvement in benefit of the game is zero.  -->

### slide 3: reverse ecology 

Traditionally, in studies linking genetics with ecology, 
scientists used to 
first identify a
<!-- n ecological adaptive  -->
phenotype and then try to detect causal genetic variation.

However, and thanks to HTS, 
it is now possible to reverse this framework.
Meaning we can now study the ecology of a species 
using the genomic information retrieved as a starting point. 

The Reverse Ecology framework uses 
advances in both 
systems biology and genomic metabolic modeling to implement community ecology studies with
no *a priori* assumptions about the organisms under consideration.

By moving from the taxon to the community level, Reverse Ecology set a new era for the study of microbial community ecology too. 

However, each and every step of this framework,
comes with a number of challenges. 

### slide 4: challenges

However, this new era is not as ideal as it may sounds. 
From the very first step of the framework shown in the previous slide, 
several issues arise. 
Getting the taxa present along with their relative abundandces 
using HTS data and then assemblying those reads to get 
their genomes as well as the annotation of these genomes 
meet several limitations and challenges; 
both from a biological and a computational point-of-view. 

<!-- and thus the functional processes that these taxa 
are able to perform, but even further  -->
That applies for the genome-scale metabolic reconstruction as well as in the analysis of the corresponding models carries several too. 
<!-- with the metabolic model of each of these taxa and finally with 
a model that integrates the corresponding genome-scale metabolic models of the community, is far from easy! 

On the contrary, each step of the way comes with a great range of challenges;  -->
Of corse, a great number of these challenges are strictly biology-oriented.
However, there is a also a great number of challenges 
that are strongly related to the bioinformatics and 
the computational aspect of the analysis of the derived data. 
On top of that, it is only with bioinformatics methods that such data 
can reveal their true potential. 


### slide 5: aim of this phd

The aim of this PhD was double:

1. to enhance the analysis of microbiome data by building algorithms and software
that address limitations and on-going computational challenges, and

2. to exploit state-of-the-art methods to identify taxa and functions that play a key
part in microbial community assemblages in hypersaline sediments.


### slide 6: graphical abstract

Here is an overview of my PhD-related work is shown. 

As mentioned, computing requirements can be quite a limitation when it comes to the 
handling of HTS data. 
High Performance Computing environments may support the needs of a great range of 
bioinformatics analyses enabling large scaling.
We will first discuss about a regional HPC system such as the one in IMBBC to 
highlight the necessity of computing resources in the most various ways in modern biology. 

Then, 2 challenges regarding the *who* will be discussed along with 2 corresponding software 
solutions I developed to address them. 

Moving to the *how* question, 
a multiphase Markov Chain Monte Carlo algorithm for sampling on the flux space 
of metabolic networks I contributed to is presented. 

Finally, a knowledge-base including *who-what-where*  associations 
and a hypothesis generation web-platform
will demonstrate how data integration and mining techniques may exploit
omics' data sets and literature even furhter.

Last but not least, some first results and conclusions from the use case 
of the hypersaline Tristomo marsh in Karpathos will be discussed highlighting 
the benefits of bioinformatics approaches such as those mentioned as well as 
their potential. 


------------------------

## HPC


### slide 7: Review title 




### slide 8: Zorbas architecture 





### slide 9: HPC measurements




-----------------


## HTS - ORIENTED CHAPTERS



### slide 10: Bioinformatics challenges

So the first challenges I dealt with were about HTS data analysis and most specifically the analysis of metabarcoding data. 

The challenges however of the method have a great range 
starting from the sampling procedures to the analysis of the taxa found along with their relative abundances. 

Two of the most common issues that arise when handling
metabarcoding data is the various steps of the 
bioinformatics analysis required to move from the raw sequencing data to a table of taxa along with their relative abundances. 

Multiple tools and databases as well as their continuous versioning makes the analysis challenging especially in terms of FAIRness, meaning to allow to the community to reproduce your analysis in an easy way. 

Another common issue is the presence of sequence reads that in the end of the analysis have not been assigned to a taxon. 
These known unknowns can be novel taxa of the taxonomic groups 
or something quite out-of-scope! 


### slide 11: PEMA INTRO

Briefly speaking, environmental DNA metabarcoding is a widely used method for biodiversiy assessment based on a single marker gene that varies based on the taxonomic group of study. 

Based on that marker gene, one may have a quite detailed overview of the biodiversity of a sample from almost any environment. 

So, in the first place I developed a workflow aiming at a
easy to use, 
one-stop-shop for the analysis of metabarcoding data. 

And as studies that exploit this approach may range 
from a few to thousands of samples being scalable was also 
among my goals. 

To this end, I developed PEMA. 


### slide 12: challenges in metabarcoding 


### slide 13: PEMA overview





























### slide   -- FUNCTIONS IN MARSH 

that form intermediates of a metabolic pathway. 
Examples of such are found in the citric acid cycle (TCA cycle).
Anaplerosis is the act of replenishing TCA cycle intermediates that have been extracted for biosynthesis (in what are called anaplerotic reactions).

### slide 44 - TRISTOMO CONCLUSIONS





### slide 45 - GENERAL CONCLUSIONS





### slide 46 - PERSPECTIVES






### slide 47 - WRAP UP 

To sum up, during my phd i contributed in 4 coding projects aiming to address on-going challenges 
in the analysis of microbiome data. 

Almost everything regarding these tools is open and if anyone is interested to contribute please
go for it!

### slide 48 - PUBLICATIONS 

These tools and therefore most of the chapters of my thesis, 
have already been published in peer-reviewed journals 
and it is only the Tristomo marsh study that is still under review. 

Hopefully we will get some feedback any time now. 


### slide 49 - FUNDING

Obviously, I could not have done any of this if it was not for the funding I had all these years. 
So, I would like to thank the funding organisations but mostly all those that 
helped in writing the proposals that were funded and allowed me to come throught with this. 

# slide 50 - ACKNOWLEDGEMENTS

Having said that, I would like to thank my promotors as well as all the 
members of my committee for their time. 

And of course, all those that tolerated me in the bad times 
and shared my happiness in the good ones. 

Thank you. 



