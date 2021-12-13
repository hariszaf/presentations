# Mikrobiokosmos 20021



## Intro Slide 

Good evening everyone! 

Many thanks to Mikrobiokosmos for this great conference 
and for the chance to share with you some piece of our research. 


## Slide 1

A genome-scale metabolic model (GEM) is a mathematical representation
of the metabolism of an organism and it provides thorough
gene–reaction–metabolite connectivity.

Over the last 30 years extensive work has been done to build such models. 

Nowdays, especially in case of microbes, automatic workflows enable such reconstructions based on the genome of an organism. 

However, GEM reconstruction is still a rather challenging task and
in more complex organisms requires huge effort. 



## Slide 2

So, to conceptualize a metabolic model we need to stop thinking 
metabolism in terms of metabolic maps.
Instead think it as a graph, where the nodes of this graph 
are the metabolites present
and the edges are the reactions. 

Now, this is exactly what the information present in a 
stoichiometric matrix like this one here. 

Each row is a metabolite and each column a reaction. 
Thus, what we have in column 1 for example
is the stoichiometry of reaction 1. 

Now that we know what are the reactions that potential may take place in the organism under study, what we would love to know, 
is **how fast** a reaction occurs under certain circumstances. 

So, the **flux** of a reaction is the rate of turnover of molecules through this reaction. 

Constraint based modeling, allows us to calculate the fluxes 
of the different reactions of a GEM, 



## Slide 3

If we sample a sufficiently large number of points, uniformly distributed, in the polytope,
then these correspond to uniformly at random sample of steady states of the metabolic network.

In this way we can obtain an overview of all the possible flux values and  generate the probability distribution for each flux.
Hence, we obtain a thorough representation of the steady states of the metabolic network and we can
study the properties of certain components of the whole network to deduce significant biological insights.



## Slide 4 - MMCS

At each phase i ≥ 0 we sample at most λ points from Pi. 

We generate them in chunks; we also call them chain of sampling points. Each chain contains at most l points (for simplicity consider l = O(1)). 

To generate the points in each chain we employ BW, starting from a
point inside Pi; the starting point is different for each chain. 

We repeat this procedure until the total number of samples in Pi reaches the maximum number λ; we need λl chains. 

To compute a starting point for a chain, we pick a point uniformly at random in the Chebychev ball of Pi and we perform O(√d) burn-in BW steps to obtain a warm start.

After we have generated λ sample points we perform a rounding step on Pi to obtain the polytope of the next phase, Pi+1

We compute a linear transformation, $T_i$ that puts the
sample into isotropic position and then $P_i+1 = T_i(P_i)$. 

To find the suitable Ti we compute the SVD decomposition
of the matrix that contains the sample row-wise






## Thank you slide
That's all from me. 
Thank you for your attention 
and best wishes for the rest of the conference. 

 



       % \begin{definition}
      %    a probability distribution over vectors is said to be in isotropic position if its covariance matrix is equal to the identity matrix.
      % \end{definition}

      % \begin{definition}
      %    a covariance matrix (also known as auto-covariance matrix, dispersion matrix, variance matrix, or variance–covariance matrix) is a square matrix giving the covariance between each pair of elements of a given random vector. Any covariance matrix is symmetric and positive semi-definite and its main diagonal contains variances (i.e., the covariance of each element with itself).
      % \end{definition}



            % \item Sample $O(d)$ points from $P_i$ with \textbf{Billiard walk} and estimate the Effective Sample Size (ESS) of the sample in $P_i$.
            % \item Map the sampled points to an isotropic position and apply the same transformation $T_i$ to $P_i$, set $P_{i+1} = T_i(P_i)$.
            % \item $i=i+1$; goto 1.
            % \item Stop when the sum of ESS $>N$ \textbf{and} PSRF $<1.1$.
