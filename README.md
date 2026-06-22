# One-Stage Cluster Sampling with R

This project was developed to demonstrate **cluster sampling**, with a particular focus on **one-stage cluster sampling**, using the R programming language.

Within the scope of the project, a sample dataset was created, the population was divided into clusters, clusters were randomly selected, and basic statistical calculations were performed based on the selected clusters.

## Project Overview

Cluster sampling is a practical sampling method used to select a sample from a large population. In this method, the population is divided into smaller groups called **clusters**. Then, some of these clusters are selected randomly, and the units within the selected clusters are included in the sample.

This approach is especially useful in large geographic areas and in studies involving schools, households, healthcare research, and other large populations, as it helps reduce time and cost.

## Objectives

The main objectives of this project are to:

- Explain the logic of cluster sampling
- Apply one-stage cluster sampling in R
- Perform random cluster selection
- Create a sample based on selected clusters
- Compute basic statistical measures such as mean, variance, standard error, and confidence intervals
- Support the theoretical presentation with practical R code

## Technologies Used

- R
- dplyr
- readxl

## Project Structure

```text
one-stage-cluster-sampling-r/
│
├── README.md
├── presentation/
│   └── kume-orneklemesi-tek-asamali.pdf
│
├── scripts/
│   ├── example_cluster_sampling.R
│   └── cluster_sampling_functions.R
│
└── data/
    └── example_data.xlsx
