#relation-algebra

## I. Definition
---
Similar to the ER model, Relational Algebra has the basic model and extended model.

More formally,

> [!abstract] Definition
> relational algebra is a branch of math that deals with *algebraic operations (consisting of operands and operators) that represent relations*.
>  - as a query language for relations
>  - theoretical foundation for SQL
>
> The returned relations must have:
> - closure
> - composibility


## II. Operations
---

### A. Core Relational Algebra
- [[#Set Operations]]
- [[#Selection]]
- [[#Projection]]
- [[#Cartesian Products]]
- [[#Joins]]
- [[#Renaming]]

#### Set Operations
Relation must have the same schema.
- Union $\boldsymbol{\cup}$
- intersection $\boldsymbol{\cap}$
- difference $\boldsymbol{\setminus}$

#### Selection
> [!info] Selection
> $$\sigma_{Condition}(\text{R})$$
> Return tuples in R that satisfies a condition C.

#### Projection
> [!info] Project
> $$\Pi_{A_1\dots A_k}(\text{R})$$
> Picks columns of attributes $[A_1, \dots A_k]$ of R.

##### Extended Projection
> [!info] Extended Projection
> $$\Pi_{A_1, A_2 + A_3 \rightarrow B}(\text{R})$$
> The attribute list may contain arbitrary expression involving attributes:
> 1. Arithmetic operations on attributes, e.g. $A_1 + A_2 \rightarrow B$
> 2. Duplicate occurences of the same attributes.

#### Cartesian Products
- Products $\boldsymbol{\times}$

#### Joins
- Joins $\boldsymbol{\bowtie}$
	- Join
	- Theta-Join
	- Equi-Join
	- Natural-Join

#### Renaming
- **Renaming** of *relations* and *attributes* $\boldsymbol{\rho}$

### B. Extended Relational Algebra
- **Extended**
	- Duplicate Elimination $\boldsymbol{\delta}$
	- Sorting $\boldsymbol{\tau}$
	- Grouping and Aggregation $\boldsymbol{\gamma}$
	- Outer-Joins
		- Outer-Join
		- Full Outer-Join
		- Left Outer-Join
		- Right Outer-Join


## III. Limitations
---
- Some queries cannot be represented
	- Recursive queries
- More expressive languages needed
