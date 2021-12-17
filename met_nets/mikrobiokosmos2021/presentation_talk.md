# Mikrobiokosmos 2021



## Intro Slide 

Good evening everyone! 

Many thanks to Mikrobiokosmos for this great conference 
and for the chance to share with you some piece of our research. 

<!-- 
## Slide 1: GEMs

A genome-scale metabolic model (GEM) is a mathematical representation
of the metabolism of an organism.

GEM reconstruction is a rather challenging task and
in more complex organisms requires huge effort. 

However, nowdays, especially in case of microbes, 
automatic workflows enable such reconstructions based on the genome sequence.  -->

<!-- NOTES FOR SLIDE 1 -->
<!-- and it provides thorough gene–reaction–metabolite connectivity. -->
<!-- Over the last 30 years extensive work has been done to build such models. -->
<!-- for a great range of species; from bacterial strains to the higher primates.  -->
<!-- To conceptualize a metabolic model we need to think of metabolism -->
<!-- not in terms of metabolic maps, but  -->
<!-- as a graph. -->
<!-- A graph where the nodes are the metabolites present and the edges are the reactions.  -->


## Slide 1: Stoichiometric matrix

Yesterday, Prof Campanaro gave a truly inspiring talk 
highlighting how one can use MAGs to build metabolic models
and how these models can be used to shed light at least
in some corners a maze such as the one of anaerobic digestion.

As he said, a genome-scale metabolic model (GEM) is a mathematical representation
of the metabolism of an organism.

The stoichiometri matrix $S$ that derives from such a model, 
includes the **metabolites** present in the organism as its rows
and the **reactions** as columns,
meaning the values of a column are the **stoichiometric coefficients** of each metabolite 
in the corresponding reaction.

<!-- As you can see in matrix $S$ here, each row is a metabolite 
and each column a reaction.  -->
<!-- Thus, what we have in column 1 for example
is that 1 molecule of the orange triangle is consumed 
for a red rectangle to be produced. -->


<!-- Such a stoichiometric matrix may include not only the 
reactions that take place inside a cell. -->
<!-- Exchange reactions representing the flow of metabolites in and out of the cell, can be included too.  -->

<!-- Further **constraints** such as the growth of the organism under study is incorporated into the reconstruction. -->

<!-- Such functions simulate metabolites consumed during biomass production.  -->

Once the model is built, the question is **how much** a reaction occurs under certain circumstances. 

The rate of turnover of molecules through a reaction is called a **flux**.

The stoichiometric relationships 
<!-- impose a series of **mass balance constraints**, -->
<!-- while  -->
<!-- and the lower and upper bounds of each flux impose certain **capacity constraints**.  -->
constraints for the model.

When applied to the network these constraints define its **allowable solution space**. 

**Constraint based modeling**, allows us to calculate the fluxes of the different reactions of a model.


<!-- Using the widely known Flux Balance Analysis, we can get a single,
optimal flux distribution that maximizes or minimizes the objective function and lies on the edge of the allowable solution space.  -->

The widely known Flux Balance Analysis that has been proven extremely useful,
is strongly dependent on an objective function and that is not a straight-forward task.
But most importantly, it returns a **sole flux vector** out of infinite. 

<!-- The stoichiometries impose constraints on the flow of metabolites through the network. -->

<!-- Moreover, building an objective function and especially a biomass function that 
is commonly used in such studies, is not a straight-forward task. -->

## Slide 2: Sampling definition

So what if we could have the distribution of the flux values of each reaction instead of a single value
without the need of an objective function? 

If we sample a sufficiently large number of uniformly distributed points, we can generate the probability distribution of each flux.

<!-- Hence, we can obtain a thorough representation of the steady states of the metabolic network and we can study the properties of certain components of the whole network to deduce significant biological insights. -->

In addition, flux sampling can be used **both** with and without an objective function.

<!-- providing flux distribution of each reaction considering that one is optimized.  -->
<!-- In the first case, instead of sampling in the whole of the solution space 
we sample in a smalle part of it where the objective function becomes minimum or maximum.  -->
<!-- In the first case, we are able to sample steady states when a particular reaction goes at its minimum or maximum.  -->


## Slide 3 - MMCS

The geometic representation of the solution space is called **polytope**.

As we move to models with more reactions and therefore to polytopes of higher dimension,
sampling gets challenging. 

Polytopes, derived from GEMs are usually rather skinny making uniform sampling even harder.

To address this challenge, we developed a Multiphase 
Monte Carlo Sampling algorithm which runs at phases, transforming 
the polytope from phase to phase.

At each phase, we sample several points using the current polytope. 
<!-- Each chain contains at most l points (for simplicity consider l = O(1)).  -->

<!-- To generate the points we employ an efficient implementation of Billiard Walk. -->

<!-- We repeat this procedure until the total number of samples in Pi reaches the maximum number λ; we need λl chains.  -->

<!-- To compute a starting point for a chain, we pick a point uniformly at random in the Chebychev ball of $P_i$ 
and we perform $O(\sqrt{d})$ burn-in BW steps to obtain a warm start. -->

<!-- After we have generated a number of sample points  -->
We perform a rounding step on the current polytope to obtain the polytope of the next phase.

To this end, we compute a linear transformation, that puts the sample we just built into isotropic position and then we apply this transformation on the current polytope. 

Once the algorithm converges, the samples found are mapped back in the initial polytope.
<!-- To find the suitable $T_i$ we compute the SVD decomposition of the matrix that contains the sample row-wise. -->


## Slide 4: Renz et al.
In 2020, Renz et al. built the biomass function of SARS-CoV-2
and they integrated it, into the metabolic model of a human alveolar macrophage,
along with a host biomass maintenance function. 

Using FBA they optimized their model first for the host biomass maintenance function 
and then for the virus biomass function.

This way they were able to find that the GK1 reaction is a potential antiviral target. 

<!-- Knocking-out GK1 decreased the growth of the virus to zero, while not affecting the host.  -->


## Slide 5: MMCS on the Renz et al. model

To demonstrate the potential of flux sampling, we used this model 
and ran our MMCS algorithm:  
   a. first by maximizing the maintenance function 
   b. and then by maximizing the virus biomass function 

<!-- Using the corresponding values for the Tyramine Sulfotransferase and the Guanylate kinase reactions, 
we built their corresponding distributions. -->

As you see the flux distribution of Tyramine Sulfotransferase, 
is exactly the same in both cases, 
while in case of GK1, the flux increases dramaticcaly when the virus biomass function is maximized.
<!-- indicating that SARS-Cov-2 has a great impact on 
that reaction and by fixing that you may reverse its effects.  -->


## Slide 6: Further applications of flux sampling

The potential applications of flux sampling are numerous! 

Preparing this presentation I found out about a "fragrant" (μοιρωράδτος) 
study that was published only a couple of months ago, where flux sampling was used in developing or 
selecting optimal aroma-producing yeast stains for winemaking.

My future plans are to focus on microbial communities 
and using flux sampling on such models, investigate microbial interactions. 
So it was nice to hear Prof Campanaro that this is something actually possible! 


## Slide 7: `dingo` library

Our MMCS algorithm, initially written in C++, 
is now available as a Python library and you may find a 
tutorial on how to use it either throught its GitHub repo
or this GCollab notebook. 


## Thank you slide
That's all from me. 
Thank you for your attention 
and best wishes for the rest of the conference. 

 

<!-- 

       % \begin{definition}
      %    a probability distribution over vectors is said to be in isotropic position if its covariance matrix is equal to the identity matrix.
      % \end{definition}

      % \begin{definition}
      %    a covariance matrix (also known as auto-covariance matrix, dispersion matrix, variance matrix, or variance–covariance matrix) is a square matrix giving the covariance between each pair of elements of a given random vector. Any covariance matrix is symmetric and positive semi-definite and its main diagonal contains variances (i.e., the covariance of each element with itself).
      % \end{definition}



            % \item Sample $O(d)$ points from $P_i$ with \textbf{Billiard walk} and estimate the Effective Sample Size (ESS) of the sample in $P_i$.
            % \item Map the sampled points to an isotropic position and apply the same transformation $T_i$ to $P_i$, set $P_{i+1} = T_i(P_i)$.
            % \item $i=i+1$; goto 1.
            % \item Stop when the sum of ESS $>N$ \textbf{and} PSRF $<1.1$. -->
