#ER-models 

## I. Data Modeling
---
> [!note]
> A relational database is a collection of relations.

We need a semantic (high-level) model to translate this relationship to an application.

Thus we need to follow a *database design process*. (Slide 4/53)

1. Requirements Analysis: data requirements, critical operations on the data
2. **Conceptual DB Design: high-level description of data and constraints, typically using ER modeling**
3. Logical DB Design: conversion into a schema
	- pick a type of DBMS, most popularly relational DBMS
4. Schema Refinement: normalization (eliminating redundancy)
5. Physical DB Design: load balancing, indexing and clustering data
6. Application/Security Design

## II. Entity-Relationship Model (ER)
---
- A visual model
- An **entity** maps to tuple of attributes
- An **attribute** can be:
	- *single-valued* or *multi-valued*
	- *atomic* or *composite*
	- *stored* or *derived*
	- part of a **key** (a set of attributes)
		- In the case many keys exist, a **primary key** is decided.
- A **relationship** is an association among two or more entities
	- **relationship set**: collection of similar relationships

### Constraints on  Relationship Sets
#### 1. Key
- one to one
- one to many
	- ***relationship attributes*** **can be moved to the many side**.
	```mermaid
	graph TB
		employee --- m{manages} --- since
		departments --> m
    ```
	```mermaid
	graph TD
		employee --- m{manages}
		since --- departments --> m
    ```
- many to many

#### 2. Participation
- partial
- total

### Weak Entity Sets
- entity sets that *do not have enough attributes to form a key* are called **weak entity sets**.
- complete dependent on the primary key of another **owner** entity for unique identification.
- owner set and weak entity set's *relationship set* must be:
	- *one-to-many* (single owner, many weak entities)
	- weak entities have *total participation*
- **partial key**
	- may be used to distinguish between weak entities related to the same owner
	```
	key of weak entities = key of owner set + partial key
	Example:
		StateName is unique
		CityName can be duplicate
		key for CityName = StateName + CityName
	```
 
- a weak entity can be owner of another weak entity