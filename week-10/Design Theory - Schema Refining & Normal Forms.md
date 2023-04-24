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

## Decomposition

- Lossless-Join
- Dependency-Preserving


# III. Normalization & Normal Forms

| Normal Form | Description                                                                   |
| ----------- | ----------------------------------------------------------------------------- |
| 1NF         | - Eliminate *repeating groups* in individual tables.                          |
|             | - Create *separate table for each set* of related data.                       |
|             | - Identify each set of related data *with a primary key*.                     | 
| 2NF         | - Create separate *tables for sets of values that apply to multiple records*. |
|             | - Relate these tables *with a foreign key*.                                   |
| 3NF         | - Eliminate *fields that do not depend* on the key.                           |
| BCNF        | - Is a *slightly stronger* version of 3NF                                     |
|             |                                                                               |

| Constraint                                                                                                                                      | 1NF | 2NF | 3NF | BCNF |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | --- | --- | --- | ---- |
| Unique rows (no duplicate records)                                                                                                              | OK | OK | OK | OK  |
| Scalar columns (columns can not contain relations or composite values)                                                                          | OK | OK | OK | OK  |
| Every non-prime attributes has a **full** *functional depd.* on a candidate key (attributes depend on the complete primary key)                 |     | OK | OK | OK  |
| Every non-trivial *functional depd.* either begins with a superkey or ends with a *prime attribute* (attributes depend only on the primary key) |     |     | OK | OK  |
| Every non-trivial *functional depd.* either begins with a superkey or ends with *an elementary prime attribute* (stricter form of 3NF)          |     |     |     | OK  |
|                                                                                                                                                 |     |     |     |      |

### Database Normalization
<iframe class="my-wiki-iframe" src="https://en.m.wikipedia.org/wiki/Database_normalization" />

### Boyce-Codd Normal Form (BCNF)

For this course, BCNF is **the focus**.

> [!info] Definition
> A relation R is in BCNF if,
> - whenever some dependency $X \rightarrow B$ is _non-trivial_, then
> - X is a _key_ or _superkey_, i.e.
> 	- $X^+$ = {all attributes}
