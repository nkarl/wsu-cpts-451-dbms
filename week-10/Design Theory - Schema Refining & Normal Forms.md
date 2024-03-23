#design-theory #schema-refinement #functional-dependencies #normal-form #1NF #2NF #3NF #BCNF #normalization #loss-join #dependency-preserving

> [!tip] DB Design Program
> 1. Requirement Analysis
> 2. Conceptual DB Design
> 3. Logical DB Design
> 4. **Schema Refinement:** *normalization*
> 	- eliminate redundancy
> 5. Physical DB Design: consider workloads, indexes and clustering of data
> 6. Application/Security Design


# I. Schema Refinement

There are few **problems caused by redundancies**:
- ***redundant storage***
	- unnecessary duplication of data
- inconsistency on UPDATE
	- case:
		- when one copy of repeated data is updated
	- expectation:
		- all data must be updated
- inconsistency on INSERT
	- case: 
		- it may not be possible to store some information,
	- expectation:
		- unless some other unrelated information is also added
- inconsistency on DELETE
	- case:
		- it may not be possible to remove some data
	- expectation:
		- without losing some other unrelated data

## Solution
- Design by decomposition
	- We start with "mega" relations, break them down into smaller (and better) relations with the same information.
	- Automatic decomposition
		- Mega relations + properties of the data (*functional dependency*)
		- System will then decompose automatically based on properties
		- Final sets of relations satisfy *normal form*
			- *i.e.* there shall be no inconsistencies, and no loss of information


# II. Functional Dependencies

## Decomposition

- Lossless-Join
- Dependency-Preserving


# III. Normalization & Normal Forms

- https://www.wikiwand.com/en/Database_normalization

| Normal Form | Description                                                                   |     |
| ----------- | ----------------------------------------------------------------------------- | --- |
| 1NF         | - Eliminate *repeating groups* in individual tables.                          |     |
|             | - Create *separate table for each set* of related data.                       |     |
|             | - Identify each set of related data *with a primary key*.                     |     |
| 2NF         | - Create separate *tables for sets of values that apply to multiple records*. |     |
|             | - Relate these tables *with a foreign key*.                                   |     |
| 3NF         | - Eliminate *fields that do not depend* on the key.                           |     |
| BCNF        | - Is a *slightly stronger* version of 3NF                                     |     |
|             |                                                                               |     |

| Constraint                                                                                                                                                                                                                                                                                  | 1NF | 2NF | 3NF | BCNF |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- | --- | --- | ---- |
| **Unique rows** (no duplicate records)                                                                                                                                                                                                                                                      | OK  | OK  | OK  | OK   |
| **Scalar columns** (columns can not contain relations or composite values)                                                                                                                                                                                                                  | OK  | OK  | OK  | OK   |
| <span style=color:navy;font-weight:700>non-prime attributes</span> must <span style=color:green;font-weight:700><u>depend fully</u> on a Candidate Key</span>, not part of it (full functional dependency).<br>(attributes depend on a complete primary key)                                |     | OK  | OK  | OK   |
| <span style=color:navy;font-weight:700>Non-trivial functional dependencies</span> either <span style=color:green;font-weight:700>begin with a super-key</span> or <span style=color:green;font-weight:700>end with a prime attribute</span>.<br>(attributes depend only on the primary key) |     |     | OK  | OK   |
| <span style=color:navy;font-weight:700>Non-trivial functional dependencies</span> either <span style=color:green;font-weight:700>begin with a super-key</span> or <span style=color:green;font-weight:700>end with an elementary prime attribute</span>.<br>(stricter form of 3NF)          |     |     |     | OK   |
|                                                                                                                                                                                                                                                                                             |     |     |     |      |

### Database Normalization

Database normalization is the process of structuring a relational database in accordance with a series of normal forms in order to:

1. **reduce data redundancy**, and
2. **improve data integrity**.

### 1NF

1. atomic data points
	- for each attribute $A_i$ in the table should contain *atomic* data, ie no records should contains *data separated by comma* (multi-valued) in any of its columns.
2. unique attributes and distinct records

### 2NF

1. is 1NF.
2. any non-prime attribute $A_i$ must depend fully on the Candidate Key.
	- case 1: has a ***single***-attribute UID, ie a **Primary Key**.
		- every non-prime attribute $A_i$ must depend on the primary key.
	- case 2: has a ***multi***-attribute UID, ie a **Candidate Key**.
		- every non-prime attribute $A_i$ *that are not part of the Candidate Key* must depend fully on the UID.
		- In other words, each non-prime (regular) attribute must depend on <strong><u>all</u></strong> attributes in the UID.
	- In other words, no partial dependency is allowed.

### 3NF

1. is 2NF.
2. non-key attributes must not *transitively* depend on the primary key. 

#### Transitive Dependency

A transitive dependency is an **indirect/implicit functional dependency** where 
$$
\begin{align}
X\rightarrow Z\quad&\text{(X determines Z)}\cr
\text{ where }\cr
&X\rightarrow Y\cr
&Y\rightarrow Z
\end{align}
$$

In other words, a 3NF requires each functional dependency to a direct and 1-hop order.

### BCNF (Boyce-Codd Normal Form)

For this course, BCNF is **the focus**.

> [!info] Definition
> A dependency $X\rightarrow B$ in some relation $\mathbf{R}$ is either **trivial** or **non-trivial**.
> 
> $\mathbf{R}$ is in BCNF if,
> - whenever some dependency $X \rightarrow B$ is **non-trivial**, then
> - X is a _key_ or _superkey_, i.e.
> 	- $X^+$ = {all attributes}

> [!note] Definition (Alternative)
> A relation $\mathbf{R}$ is in BCNF if, for every dependency $X\rightarrow B$ in $\mathbf{R}$, one of the following cases must be true:
> - $X\rightarrow B$ is trivial ($Y\subseteq X$)
> - $X$ is a superkey of R.
> 

#### Triviality vs Non-Triviality

A superkey is trivial when it covers all attributes.

It follows that any non-trivial superkeys are keys that cover a subset of the trivial superkey.

#### Candidate Key

A Candidate Key is a minimal superkey, ie a superkey that does not contain a smaller key. A superkey is any set of attributes that uniquely identifies each tuple of relation, ie a UID.

### 4NF
