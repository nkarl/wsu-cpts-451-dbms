#design-theory #schema-refinement #functional-dependencies #normal-form #1NF #2NF #3NF #BCNF

> [!tip] DB Design Program
> 1. Requirement Analysis
> 2. Conceptual DB Design
> 3. Logical DB Design
> 4. **Schema Refinement:** *normalization*
> 	- eliminate redundancy
> 5. Physical DB Design: consider workloads, indexes and clustering of data
> 6. Application/Security Design


# I. Schema Refinement

There are few problems caused by redundancies:
- redundant storage
	- unecessary duplication of data
- anomalies on UPDATE
	- *when one copy of repeated data is updated, all data must be updated to avoid inconsistency* (anomaly)
- anomalies on INSERT
	- it may not be possible to store some information, unless some other unrelated information is also added
- anomalies on DELETE
	- it may not be possible to remove some data without losing some other unrelated data

## Solution
- Design by decomposition
	- We start with "mega" relations, break them down into smaller (and better) relations with the same information.
	- Automatic decomposition
		- Mega relations + properties of the data (*functional depd.*)
		- System will then decompose automatically based on properties
		- Final sets of relations satisfy *normal form*
			- *i.e.* there shall be no anomalies, and no loss of information


# II. Functional Dependencies


# III. Normalization & Normal Forms

## Boyce-Codd Normal Form (BCNF)

**The most important form to our theory database design in this course**.

> [!info] Definition
> A relation R is in BCNF if,
> - whenever some dependency $X \rightarrow B$ is _non-trivial_, then
> - X is a _key_ or _superkey_, i.e.
> 	- $X^+$ = {all attributes}
