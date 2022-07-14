# PhD defense notes

## WELCOME

Hello everyone! 

I would like to welcome you in my phd defense and to thank you for being here. 

My phd is focusing on how various bioinformatics appproaches can benefit the study of microbial communities. 

More specifically, how bioinformatics can contribute in HTS data analysis
as well as in the further exloitation of them thanks to data integration techniques
and metabolic modeling. 

<!-- Moreover, even if metabolic modeling has been providing with great insight for over the last 30 years,
it is only recently that has been used at the microbial community level.  -->

In the next 40' I will try to highlight: 
* how each of my disseration's chapters 
contributes ,as well as 
* the key parts for implementing each of the software and studies that were performed


## INTRODUCTION
### slide 1: microbial ecology in general

It goes without saying, microbial ecology is the ecology of microorganisms: 
their relationship with one another and with their environment.


In general, microbial communities play a fundamental role in forming the world as we know it. 

Indicatively, microbes 
<!-- in their vast diversity and the proccesses that carry out  -->
are responsible for the recycling of elements such as carbon, nitrogen, sulfur and more.

The study of microbial communities can help us in various ways: 

* to address basic questions about how life originated and how it evolved, 

* to measure the effects of climate change and land usage 

* to improve our lives; by facilitating food production, bio-engineering of useful products and so on and so forth


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
first identify a <!-- n ecological adaptive  -->phenotype and then try to detect causal genetic variation.

However, and thanks to HTS, 
it is now possible to reverse this framework.
<!-- Meaning we can now study the ecology of a species 
using the genomic information retrieved as a starting point.  -->

The Reverse Ecology framework uses 
advances from both 
systems biology and genomic metabolic modeling to implement community ecology studies with
no *a priori* assumptions about the organisms under consideration.

<!-- By moving from the taxon to the community level, Reverse Ecology set a new era for the study of microbial community ecology too.  -->

<!-- However, each and every step of this framework,
comes with a number of challenges.  -->

### slide 4: challenges

However, from the very first step of the framework shown in the previous slide, 
several issues arise. 
<!-- Getting the taxa present along with their relative abundandces 
using HTS data and then assemblying those reads to get 
their genomes as well as the annotation of these genomes 
meet several limitations and challenges. -->
<!-- and thus the functional processes that these taxa 
are able to perform, but even further  -->
<!-- That applies for the genome-scale metabolic reconstruction as well as in the analysis of the corresponding models carries several too.  -->
<!-- with the metabolic model of each of these taxa and finally with 
a model that integrates the corresponding genome-scale metabolic models of the community, is far from easy! 

On the contrary, each step of the way comes with a great range of challenges;  -->
Of course, a great number of these challenges are strictly biology-oriented.
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

Here is a graphical overview of my PhD-related work 
You can see the 4 main questions for microbial ecology 
along with 
the methods and the 
software developed during this PhD to address 
challenges related to each of them. 
In the end, our first results and conclusions reg.
the Tristomo marsh use case will be presented. 
<!-- and thus the structure of this presentation is shown. -->

<!-- Computing requirements can be quite a limitation when it comes to HTS data analysis.  -->
<!-- We will first discuss about a regional HPC system  -->
<!-- such as the one in IMBBC  -->
<!-- to highlight the necessity of computing resources in the most various ways in modern biology.  -->

<!-- Then, 2 challenges regarding the *who* will be discussed along with 2 corresponding software 
solutions I developed to address them. 

Moving to the *how* question, 
a multiphase Markov Chain Monte Carlo algorithm for sampling on the flux space 
of metabolic networks will be presented. -->
<!-- dingo is a Python library 
based on this work.  -->

<!-- Then, the PREGO knowledge-base 
including *who-what-where* associations  -->
<!-- and a hypothesis generation web-platform -->
<!-- will demonstrate how data integration and mining techniques may exploit
omics' data sets and literature even furhter.

Last but not least, 
some first results and conclusions from the use case 
of the hypersaline Tristomo marsh in Karpathos will be discussed  -->
<!-- highlighting 
the benefits of bioinformatics approaches such as those mentioned as well as 
their potential -->
. 


------------------------

## HPC
### slide 7: Review 0s and 1s

<!-- So,computing resources can be a great challenge 
in modern biology
for a great number of methods and approaches.  -->
In many cases, the computational requirements for  an analysis may exceed the capacity of a standard laptop/desktop by far, 
owing mostly, to the sheer volume of the data and to the computational complexity of the bioinformatic algorithms employed for their analysis. 


High Performance Computing aims at the optimal incorporation of technology, and methodology to achieve the greatest computing capability possible.

To highlight the value of such computing environments, we studied 
the IMBBC HPC facility and its decennial story. 

<!-- European Centres (Tier 0), (ii) national centers (Tier 1), and (iii) regional centers (Tier 2) -->

### slide 8: Zorbas architecture 


<!-- High Performance Computing environments may support the needs of a great range of 
bioinformatics analyses enabling large scaling. -->


The IMBBC HPC facility started as a single server and it has now overwhelmed the 
specs described in this figure. 

Since 2015 its system setup is called Zorba. 

<!-- After its latest upgrade, Zorba
has moved to 
more than 400 CPU cores & 20 nodes, splitted in 5 partitions,
with the capacity of 1.5ΤB RAM on a single node. -->


### slide 9: HPC measurements

Up to this latest upgrade, Zorba has supported 
several studies of various scopes.

As shown here, different computational methods have rather different resource requirements. 
This is why, multiple partitions with defferent specs are necessary in terms of 
supporting the needs of their corresponding research fields.

With respect to microbial ecology, amplicon data analysis 
may have high computing requirements as the number of samples increases. 
Metagenomics on the other hand, may have such high computing requirements 
even with a small number of samples as in our case study where only 6 samples were to be analysed. 

<!-- For example DE analysis shows a notable trend for both long computational times and high memory, while eDNA-based community analysis does not have high resource requirements either in computation time or memory.  -->
<!-- Therefore, systems like Zorba need to be able to address multiple different needs.  -->

<!-- In the following section, we will discuss about -->
e-infrasturtures are HPC and/or cloud based systems 
aiming to
support the needs of the research community.
<!-- but also to make bioinformatic methods accessible even to non-familiar users. -->

-----------------

## PEMA
### slide 10: Bioinformatics challenges

So, let us now move on with the challenges 
that I tried to deal with.  
<!-- The challenges however of the method have a great range 
starting from the sampling procedures to the analysis of the taxa found along with their relative abundances.  -->
Environmental DNA metabarcoding is a widely used method
addressing the question of *who* - what taxa are present in a community - 
based on a single marker gene that varies based on the taxonomic group of study. 

<!-- Based on that marker gene, one may have a quite detailed overview of the biodiversity of a sample from almost any environment.  -->

Two of the most common issues that arise in the analysis of
such data, is first, the various steps of the 
bioinformatics analysis required to move from the raw sequencing data to a table of taxa along with their relative abundances. This comes with a large number of tools and databases and their various versions. Threfore, reproducibility becomes almost impossible and it is hard for non-experts to analyse the data.

<!-- Multiple tools and databases as well as their continuous versioning makes the analysis challenging especially in terms of FAIRness, meaning to allow to anyone to reproduce your analysis in an easy way.  -->

Second, another common issue is the presence of OTUs and/or ASVs 
that do not get assigned to a taxon. 
These known unknowns can be novel taxa of the taxonomic groups 
or something quite out-of-scope! 

### slide 11: PEMA intro

So, with respect to the 1st challenge, 
I developed a workflow aiming at a easy to use, 
one-stop-shop for the analysis of metabarcoding data. 
My main intention was to 
<!-- support various combinations of tools and options to address the needs of the various metabarcoding cases. 
Therefore, to   -->
come up with a workflow that is not a black box to the user
but supports alternatives that can deal with the idiosyncracy of the various 
metabarcoding experiments. 

On top of that, metabarcoding studies may range 
from a few to thousands of samples. 
Thus, I also aimed for a scalable solution. 

As already mentioned, reproducibility was also an issue to be considered. 

## graphical abstract

So PEMA tries to address the question of *who* and these challenges


### slide 12: PEMA implementation 

by bringing together a series of third party tools and exploiting
several technologies.

PEMA exploits 
the computing resources available in a quite optimal way
and it also enables the partial re-run of specific parts of the workflow. 

Thanks to containerization technologies 
PEMA is reproducible and extremely easy to distribute. 

In addition, PEMA is meant to perform in HPC environments 
enabling the analysis of hundreds of samples.


### slide 13: PEMA overview

Here you can see an overview of PEMA's main features in its initial version. 

As shown, 4 main steps can be considered: 

*  **sequencing preprocess**, where paired-end raw reads are trimmed, filtered and merged
* then, the processed sequences can be **clustered** to OTUs using the VSEARCH tool, or ASVs can be **inferred** out of them, thanks to the Swarm algorithm 
* then, the OTUs or the ASVs retrieved are taxonomically assigned choosing among several classifiers and databases
* and finally, the taxonomy assigned OTUs or ASVs can be further analysed for biodiversity indeces etc 


### slide 14: tuning effects

PEMA was tested using both mock and real-world data.
Besides being fast and accurate, PEMA highlights the crucial role of 
parameters tuning and thus the sensitivity that metabarcoding data may come with. 

In this case shown here, sequences from a mock community were analysed 
and as you see, the precision - recall ratio considering the genus level, 
may range from 0.61 to 0.83. 

<!-- Even if F1 gets its highest value when *d* equals to 30 it is almost certain 
we would go for a *d* equal to 3
Not only as this would be quite faster, but also because when considering the species level, the latter would give us far better results.  -->

PEMA's ability to deal with that kind of data sensitivity 
(to some extent of course)
is exactly PEMA's added value compared to well established metabarcoding pipelines that work mostly in terms of a black box. 


### slide 15: PEMA v.2

Since PEMA was published several extra features have been added. 
From the coding point-of-view, the architecture of the code has been 
completely reshaped. 
<!-- It is now far easier to anyone to contribute and that is a key point in order for any workflow to manage to keep up to date.  -->
<!-- The analysis of the 12S rRNA marker gene is now also supported but  -->
The most important among them is that 
taxonomy assingment based on a custom reference database is now also supported. 

### slide 16: LW 

Running such an analysis in a personal computer is usually not an option; especially as the number of samples increases. 

In addition, PEMA uses a command line interface, meaning it is not that easy for 
researchers that are not familiar with a terminal. 

To this end, e-infrastuctures can benefit the community to a great extent. 
They provide computing resources and at the same time, they usually come with 
a graphical, user-friendly environment. 

<!-- Moreover, approaches such as the one of LifeWatch ERIC bring together tools 
enabling the user to build his/her own workflows.  -->



### slide 17: PEMA conclusions 


So, 
<!-- what we should keep as a take-home message from this part -->
tuning is crucial for metabarcoding studies. 

From a more technical point-of-view, big data pipeline oriented programming languages and workflow managers such as CWL, nextflow etc. along with containerization technologies enable building complex workflows.

e-infrastuctures 
can benefit the community to a great extent providing 
the computing resources required. 


------------------------

## DARN 

### slide 18: DARN intro

Let us now move to the second challenge mentioned. 
My task here, was to deal with the known unknown OTUs and or ASVs in COI data. 

The heme aa3-type cytochrome c oxidase (COX) is the terminal electron acceptor in the respiratory chain of mitochondria and many bacteria. 

COI has been widely used for studied targeting eukaryotes. 
However, in many cases, a great proportion of the sequences retrieved 
do not get a hit in the reference databases used. 

We argued that a proportion of such sequences correspond to known and/or unknown microbial taxa. 


### slide 19: sequences for the tree

To evaluate our hypothesis we built a phylogenetic tree covering both eukaryotes and
bacteria and archaea. 
Once we would build such a tree we could then use phylogenetic placement methods 
to place OTUs and/or ASVs of our interest onto this tree to find out whether they represent target or non-target taxa. 

Eukaryotic COI sequences were covered using Midori 2. 

However, the collection of non-eukaryotic COI sequences was not that straight-forward. 

From BOLD database I was able to retrieve only a few thousand bacterial and 117 archaeal sequences. 
<!-- representing about 23 hundreds and 117 strains correspondingly.  -->
To enrich the non-eukaryotic set of sequences the PFam database was also exploited.
<!-- For all the PFam protein sequences related to the accession number for COX1
the respective DNA sequences were extracted from their corresponding genomes. 
This way, an additional 217 archaeal and 9,154 bacterial sequences were obtained. -->

<!-- In total, sequences from 15 archaeal, 371 bacterial families and 60 taxonomic groups of higher level not assigned in the family level, were gathered.  -->

Then, consensus sequences at the class level for the case of eukaryotes and 
at the family level for the case of bacteria and archaea were built. 


### slide 20: tree evaluation

So, based on these consensus sequences a COI-oriented phylogenetic tree of life was built. 

Apparently, the phylogenetic signal of eukaryotes is quite stronger compared to those of the other 2 domains as the initial set of sequences was quite biased. 

However, as you see, the placements of the consensus sequences on it verified 
the tree is actually valid. 


### slide 21: results using DARN

DARN takes as input a .fasta file with the OTUs or the ASVs of a sample and 
places them onto this phylogenetic tree. 

To validate our initial hypothesis, several data sets were analysed with DARN
covering cases of different sampling methods, primers and PCR protocolos as well as 
bioinformatics analysis. 

Intrestingly, regardless all the other parameters, we observed that 
while in bulk samples the vast majority of the sequences were placed in eukaryotic branches of the tree, that was not the case with sequences from environmental samples.  
Even when we changed the parameters of the bioinformatics analysis and thus, 
the number of the OTUs/ASVs retrieved from a sample was changing, the proportions 
were of the placements were rather similar. 


### slide 22: DARN conclusions 

As COI-based studies usually target eukaryotic taxa,
DARN highlights the presence of non-target, 
non-eukaryotic sequences in COI amplicon data.

As shown, this is the case especially in environmental samples. 
The reason why dark-matter is limited 
in bulk samples is still not clear; 
however, PCR-related issues could explain this behaviour to some extent. 

In any case, enriching reference databases with sequences representing non-eukaryotic
taxa, could benefit COI-oriented studies. 


---------------------

## MMCS 

### slide 23: dingo intro 

Let's now move from the question of *who* to the one of *how*. 

Given a metabolic network, meaning 
the complete set of metabolic and physical processes that determine the physiological and biochemical properties of a cell,
flux sampling is an approach that allows us to investigate feasible flux solutions 
of a species. 

We call *flux*, the rate of turnover of molecules through a reaction, i.e. 
the amount of substance per unit volume, 
per unit time, transformed in a reaction.

Flux sampling applications range from the study of a single strain 
across changing environmental conditions 
to the one of metabolic interactions at the community level. 

However, sampling is challenging from the computational point of view, 
especially as the number of dimensions of the polytope increase. 

Here we present, the Multiphase Monte Carlo Sampling algorithm 
developed by the GeomScale group
that the dingo Python library implements
to enable flux sampling in high dimensional metabolic networks.


### slide 24: metabolic modeling intro

A genome-scale metabolic model (GEM) is a mathematical representation of the metabolism of an organism, strongly related to the stoichiometric matrix  that includes the metabolites present in the organism as its rows and the reactions as columns.

Sequencing the complete genome of a strain and its functional annotation, 
allows us to have a thorough overview of the metabolic processes that 
may occur in the strain under study.
Based on the enzymes present in the genome of a species, we can now reconstruct its metabolic network. 
Of course, this network inherits all the assumptions and limitations that come with genome sequencing and annotation and the manual curation of such networks is 
almost always necessary. 
However, semi-automatic ways to build such models are now commonly used. 


### slide 25: stoichiometric matrix

Once a metabolic network is built, 
a common question is **how much** a reaction occurs under certain circumstances.

To reply this we may solve the system described here: 
matrix S is a stoichiometric matrix including the metabolites present in a metabolic network as rows, and its corresponding reactions as columns. 
The values of this matrix are actually the stoichiometry of its of the reactions described. 
It is a common practice to study a cell under the steady state assumption, meaning 
states where the production rate of each metabolite equals its consumption rate.

So we are interested in the values the flux vector may get; 
this way we can then infer key processes for the cell under changing conditions 
and/or in general. 



### slide 26: flux sampling 

The stoichiometric relationships along with the lower and upper bounds of each flux impose certain constraints for the model.

When applied to the network these constraints define its allowable solution space.

The geometic representation of the solution space of this system, is called a *polytope*. Polytopes, derived from GEMs are usually rather skinny.

The widely known Flux Balance Analysis that has been proven extremely useful, is strongly dependent on an objective function and that is not a straight-forward task. But most importantly, it returns a sole flux vector out of infinite.

<!-- So what if we could have the distribution of the flux values of each reaction instead of a single value without the need of an objective function? -->

However, if we sample a sufficiently large number of uniformly distributed points, 
we may get the distribution of the flux values of each reaction instead of a single value; with or without using an objective function. 
<!-- we can generate the probability distribution of each flux. -->

<!-- Moreover, flux sampling can be used both with and without an objective function, in case we need to get the distribution of a flux when another one is optimized. -->


### slide 27: MMCS 

To enable sampling in high dimensional polytopes, we developed a Multiphase Monte Carlo Sampling algorithm which runs at phases, transforming the polytope from phase to phase; an idea of Dr. Apostolos Chalkis. 

At each phase, we sample several points using the current polytope and Billiard walk.

We perform a rounding step on the current polytope to obtain the polytope of the next phase.

To this end, we compute a linear transformation, that puts the sample we just built into isotropic position and then we apply this transformation on the current polytope.

Once the algorithm converges, the samples found are mapped back in the initial polytope.

### slide 28: sampling output 

This way, we may get the the flux distribution of any reaction of the model 
as well as to observe how a flux reaction changes based on the  value of another reaction. 

Howe


### slide 29: flux sampling conclusions 



---------------------

## PREGO
### slide 30: PREGO intro


As already mentioned, in terms of understanding and elucidating the mechanisms that govern ecosystem function, we first need to understand what processes occur in which environments, and which organisms carry them out.

In pairs, organisms and biological processes present in an environmental type, allow us to study fundamental features of an ecosystem, such as community structure, process potential and control.

In the PREGO framework, I used data integration combined with text mining techniques to extract such associations from publicly available omics datasets. 


### slide 31: Terminology

In this context, when we are are referring to Organisms, we should consider them as NCBI Taxonomy Ids. 

Likewise, environments should be considered as ENVO terms; meaning terms included in the Environment Ontology from which we are most interested in Feature, Material and Biome terms. 


Finally, when we are talking about processes we are referring to biological processes such as ‘Growth’ or ‘sulfur oxidation’, included in Gene Ontology. 

<!-- As you may noticed, we have selected an Ontology for each of these 3 components.  -->
In general, an ontology represents a shared, agreed and detailed model of a certain knowledge domain. This way, we are able to extract terms of out interest from massive data and metadata and formulate data searching strategies. 


<!-- Aim of PREGO is to address the challenge of extracting associations among ORG-PROC and ENV by taking advantage of the global literature and the main metagenomic resources.  -->



### slide 32: Get co-occurences; methodology      

PREGO implements the well-established tagger from JensenLab to tag microbial taxa, biological and metabolic processes and environments. 

Then, it calculates a respective score for each of the paired 
co-occurrences found.


### slide 33: PREGO explain how we use omics data

This approach can be used on the literature but also in 
omics analyses output and on their related metadata. 

For example, the environment-related metadata in this case here, can be tagged
and linked with the taxa present in their corresponding OTU table. 

Thus, omics repositories such as the JGI/IMG , MG-RAST and MGnify can provide 
hundreds of thousands of samples that can be used as input to our approach. 



### slide 34: Overall Methodology


So, PREGO exploits this approach to extract associations from literature (a task covered by my colleague Savvas Paragkamian)
and omics data sets along with their metadata.

In addition, well annotated and curated genomes can provide with associations of high evidence and thus they become of high value especially when it comes to ORG-PROC associations.


In the end, PREGO ends up with millions of associations that needs to sort 
in terms of what would be useful to the user.



### slide 35: PREGO resources

Indicatively, in this table you may see the number of publications and experimnetns 
that PREGO exploits. 

More than 30 millions of papers are parsed and dozins of thousands of omics samples. 

The associations extracted form the omics samples is strongly dependent on their 
corresponding metadata. 

The Struo resource is a collection of high quality genomes which PREGO integrates as is. 



### slide 36: PREGO in action

The


### slide 37: PREGO conclusions




---------------------

## Tristomo marsh 

### slide 38: Tristomo intro 

With resepct to the 2nd aim of this phd, 
samples from 
microbial mat communities from a hypersaline marsh in Tristomo, 
a village in Karpathos island, were used. 

To identify both the taxa present in these communities and their functional 
potential, both amplicon and metagenomics analysis were performed. 

Our goal was to identify potential taxa and/or processes that have a key role 
in the functioning of these communities


### slide 39: Sampling 

Samples were collected in 2 time points, one during summer and another in winter. 

Our samples were either from true mats with top and bottom layers, of from 

We also samples some aggregates as the orange one you may see here. 

All the sampling was done by Dr. Christina Pavloudi. 

Deep sequencing was then performed in a total of 6 metagenomic and 13 amplicon samples. 


### slide 40: bioinformatics 

The amplicon data were analysed using the PEMA workflow. 

However, the analysis of the metagenomics data was not that straight forward. 

Several steps as shown in this diagram were performed.

Based on the metagenomic data, the composition of the communities was studied both at the reads level 
as well as at the one of bins. 

To this end, the metagenomes were first co-assembled and the refined bins were used to 
reconstruct metagenome-assembled genomes (MAGs). 
After manual refinement where needed, a total of:
* 178 bacterial high quality (completeness > 90%, contamination <5%), 
* 70 bacterial and 39 archaeal medium quality (50% < completeness <90% and 5% < contamination <10%), and 
* 2 bacterial MAGs of low quality (completeness score <50%) 
were retrieved. 
The vast majority of these MAGs represent novel taxa. 

The metagenomes were also assembled at the sample level as part of the DiTing software 
that determines the relative abundance of metabolic and biogeochemical functional pathway in 
metagenomic datasets. 


### slide 41: taxonomic profile comparisons 

Interestingly, each of the 3 taxonomic profiles retrieved, meaning the one coming from the amplicon data,
the one from the metagenomic raw reads and the one from the bins, returns a significan number of phyla 


As shown in this plot, 
the taxonomic profile based on the metagenomic raw reads, returns quite less phyla than the 2 other methods; 
however, thei vast majority are not covered by any of the other 2 methods. 

Yet, this is partially explained by the taxonomy issue; there is not a single taxonomy scheme in bacteria. 
This leads to multiple issues and even to get this figure here, a lot of manual work in terms of mapping synonym phyla 
to their corresponding one from one catergory to the other was done. 




### slide 42: MAGs phylogeny 

A phylogeny of the 




### slide 43: cycles of S and N 

that form intermediates of a metabolic pathway. 
Examples of such are found in the citric acid cycle (TCA cycle).
Anaplerosis is the act of replenishing TCA cycle intermediates that have been extracted for biosynthesis (in what are called anaplerotic reactions).

### slide 44 - Tristomo conclusions



---------------------

## The end


### slide 45 - GENERAL CONCLUSIONS





### slide 46 - PERSPECTIVES

In the near future, it is my intention to focus on metabolic modelling and 
constraint-based methods such as flux sampling 
and by exploiting data integration techniques, 
to infer metabolic interactions at the community level. 

This way, we may shed some further light on questions such as 
*how our microbial hyper-saline mats actually function under the various 
condintions?*
and 
*how each of the taxa present contribute to the mat's fitness?*


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

### slide 50 - ACKNOWLEDGEMENTS

Having said that, I would like to thank my promotors as well as all the 
members of my committee for their time. 

And of course, all those that tolerated me in the bad times 
and shared my happiness in the good ones. 

Thank you. 



