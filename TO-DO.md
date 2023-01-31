## Week 1
---
> [!info]
> Learn about the conceptual database design and the database design issues involving the Entity Relationship (ER) Model.  Realize why the ER model is used to create an initial design.

**Readings:**
- [x] Syllabus: [[week-1-CptS451_0_CourseDetails.pdf]]
- [x] Overview: [[week-1-CptS451_1_IntroductiontoDB.pdf]]
- [x] ER Concepts: [[week-1-CptS451_2_ERModel.pdf]]
- [x] DBMS Chap. 1-2

**Watch:**
- [x]  Introduction
- [x]  Overview of Database Systems
- [x]  ER Conceptual Data Model
	- [x] Part #1: Fundamentals of ER Models
	- [x]  Part #2: Extending ER Models

**Review Concepts: ER Models**
- [x] [[ER Model for Relational DB#6 steps of database design| 6 steps to database design]]
- [x] Entity & Entity Set
	- [x] attributes
- [x] Relationship & Relationship Set
	- [x] binary, ternary, n-ary
	- [x] roles
- [x] Constraints
	- [x] *Key* constraints (multiplicity)
		- [x] **one**-to-many
		- [x] many-to-**one**
		- [x] many-to-many
	- [x] *Participation* constraints
		- [x] Partial: B to A
		- [x] Total: A to B
		 ```mermaid
		 graph LR
			subgraph A
				a1
				a2
				a3
				a4
				a5
			end
			subgraph B
				b1
				b2
				b3
				b4
				b5
			end
			a1 --> b1
			a2 --> b1
			a3 --> b2
			a4 --> b3
			a5 --> b3
		```
- [x] Weak Entity Sets
	- [x] Owner
	- [x] Partial key


## Week 2
---
> [!info]
> Learn *the principles behind relational data organization: tables, keys, and integrity constraints*. Learn about how data is represented in relational model and how *integrity constraints can be expressed and enforced* in the relational model to ensure data *consistency and accuracy*.

**Readings:**
- DBMS Chap. 3
	- [x] *Integrity Constraints* over relations
		- [x] Domain
		- [x] Key
		- [x] Entity identity (no NULL values)
		- [x] Foreign key
- [x] Relational Model & DDL: [[Week-2-CptS451_3_RelationalModel.pdf]]

**Watch:**
- [x] ER Model - Examples
- [x] Relational Model: Intro
- [x] Relational Model: Integrity Constraints over Relations


## Week 3
---
> [!info]
> Learn about how we convert an ER diagram into a relational schema. Start learning how to create and modify relational database schemas and how to enforce integrity constraints on those using SQL.

**Readings:**
- DBMS Chap. 3
	- 3.5 Translating ER to Relational
		- [x] 3.5.1 *Entity sets to tables*
		- *Relationship sets to tables*
			- [x] 3.5.2 **without constraints**
			- [x] 3.5.3 with **key constraints**
				- *note:* need to reread the foreign key constraint example on page 78
			- [x] 3.5.4 with **participation constraints**
		- [x] 3.5.5 Translating weak entity sets
			- *weak entity sets always participates in a relationship* that is
				- one-to-many, and
				- binary
			- weak entity sets have
				- key constraint
				- total participation
		- [x] 3.5.6 Translating class hierarchies
		- [x] 3.5.7 Translating ER diagrams *with aggregation*
 
**Watch:**
- [x]  Relational Model: Introduction to SQL [[week-2-CptS451_3_RelationalModel.pdf]]
- [x]  ER to Relational Translation [[Week-3-CptS451_4_ER2Relational.pdf]]
- [x] Project Overview

**Assignments:**
- [x] HOMEWORK #1: ER Model


## Week 4
---
> [!info]
> *Learn about the formal query language Relational Algebra* which is the foundation for relational query languages like SQL. Learn the relational algebra operations and how they are combined to write complex queries.

#### Tasks
**Readings:**
- Textbook (Database Management Systems) -- Chapters 4.1, 4.2
	- [x] Relational Algebra

**Watch**:
- Relational Algebra
	- [x] Basic Operations: *use Set semantics*
		- Set, Selection, Projection, Cartesian Product, Joins
	- [x] Examples for Relational Algebra expressions
	- [x] Extended Operations: *use Bag semantics*
		- [x] [[Relational Algebra#Grouping / Aggregation|Grouping & Aggregation]]
		- [x] [[Relational Algebra#Outer-Joins|Outer Joins]]

**Lesson Slides:**
- [x] [[week-4-CptS451_5_RelationalAlgebra.pdf|Relational Algebra]]

**Assignments:**
- [ ] HOMEWORK #2: Relational Model & ER2 Relational Translation


## Week 5
---
> [!info]
> Learn how search queries are expressed in SQL. Learn about SQL’s set, grouping, aggregation, and sorting operators.

**Readings:**
-   Textbook (Database Management Systems) -- Chapter 5
	- [x] 5.2 Form of a basic SQL query
	- [x] 5.3 Set operators: UNION, INTERSECT, EXCEPT
	- [ ] 5.4 Nested queries
	- [ ] 5.5 Aggregation
	- [ ] 5.6 NULL value
	- [ ] 5.7 complex integrity constraints
	- [ ] **active database**
		- [ ] *active database*
		- [ ] *triggers*

**Watch:**
-   [x] SQL: Query Language (I)
-   [ ] PostgreSQL Introduction

**Lesson Slides:**
- [[Week-5-CptS451_6_SQL_part1.pdf | Week-5 - SQL part I]]

**Assignments:**
- [ ]   Homework 3-- Relational Algebra


## Week 6
---
> [!info]
> -   Learn how to write queries that involve multiple steps using nested queries.
> -   Study for the midterm. Take the midterm exam practice test.

**Readings:**
-   Textbook (Database Management Systems) -- Chapter 5

**Watch:**
-   [ ] SQL: Query Language (II)
-   [ ] SQL Exercises
-   [ ] Midterm Review

**Lesson Slides:**
-   [[Week-6-CptS451_6_SQL_part2.pdf | Week-6 - SQL part II]]

**Assignments:**
> [!important] Project Milestone 1
>- Schema
>	- [ ] ER diagram
>- Application
>	- [x] Set up Dockerized PostgreSQL database
>		- [x] Set up Docker container for database
>		- [x] Import data into database
>	- [x] Set up `Server API`
>		- [x] Successfully send test response to client
>		- [x] Successfully make query request to database
>		- [x] Successfully make query request to database and send data back to client as reponse
>	- [ ] Set up `Client App`
>		- [ ] Set up React app
>		- [ ] Create page compoments
>		- [ ] Adjust the layout with CSS to match requirements

-   [Sample Midterm](https://wsu.instructure.com/courses/1623110/files/95846167/preview)  (Please go over the sample midterm questions before you watch the "Sample Midterm Discussion" video.)


## Week 7
---
> [!info]
> -   Study for the midterm
> -   Take the  midterm.

**Readings:**
-   None

**Watch:**
-   Midterm review (same video from Week-6)

**Assignments:**
-   Midterm--1


## Week 8
---
> [!info]
> Learn about how to enforce complex integrity constraints on relational database schemas using SQL. Learn about key constraints, assertions, and triggers.

**Readings:**
-   Textbook (Database Management Systems) --Chapter 5

**Watch:**
-   SQL: Constraints and Triggers

**Lesson Slides:**
-   [Week-8 -SQL Constraints and Triggers](https://wsu.instructure.com/courses/1623110/files/95846221/preview "Week 7 - SQL Constraints and Triggers") 

**Assignments**
-   Homework 4--SQL Queries


## Week 9
---
> [!info]
> Learn about SQL views and how they can be used to provide support for data independence in relational databases.

**Readings:**
-   Textbook (Database Management Systems) -- Chapter 25.8

**Lesson Slides:**
-   Week 9 - SQL Views and Indexes

**Watch:**
-   SQL Views and Indexes I and II

**Assignment:**
-   Project Milestone--2

### Attachments
-   [Week-9-CptS451_8_SQL_Views.pdf](https://wsu.instructure.com/courses/1623110/files/95846198/preview)


## Week 10
---
> [!info]
> Learn about the problems caused by redundantly stored information. Understand how functional dependencies cause redundancy in relations. Learn about the normal forms and their purposes. Understand the benefits of BCNF and learn the considerations in decomposing relations into appropriate normal forms.

**Readings:**
-   Textbook (Database Management Systems) -- Chapters  19

**Watch:**
-   Database Design Theory - Intro
-   Database Design Theory - Functional Dependencies

**Lesson Slides:**
-   [[Week-10and11-CptS451_9_DesignTheory.pdf | Week 10 & 11 - Design Theory]]

**Assignment:**
-   Project Milestone 2


## Week 11
---
> [!info]
> Learn about the problems caused by redundantly stored information. Understand how functional dependencies cause redundancy in relations. Learn about the normal forms and their purposes. Understand the benefits of BCNF and learn the considerations in decomposing relations into appropriate normal forms.

**Readings**:
-   Textbook (Database Management Systems) -- Chapter 19

**Watch:**
-   Week 11 -  Database Design Theory - Closures
-   Week 11 -  Database Design Theory - BCNF
-   Week 11 -  Database Design Theory - BCNF Examples
-   Week 11 -  Database Design Theory - 3NF

**Lesson Slides:**
-   [[Week-10and11-CptS451_9_DesignTheory.pdf | Week 10 & 11 - Design Theory]]


## Week 12
---
> [!info]
> Learn about how DBMS stores persistent data. Understand why I/O cost is important for database operations and how does DBMS organize file records on disk to minimize the I/O cost. Learn the important properties of indexes. Understand how we use indexes to optimize the query performance for a given query workload.

**Readings:**
-   Textbook (Database Management Systems) --  Chapters 8, 9.5, 9.7, 20
	- [[Storage & Indexing#I. Chapter 8, Storage & Indexing Overview|Chapter 8: Storage and Indexing Overview]]
		- [x] 8.1: cost of I/O
		- 8.2 **File organizations & Indexing** (as a speedup method)
			- [ ] 8.2.1 Clustered Indexes
			- [ ] 8.2.2 Primary & Secondary Indexes
		- 8.3 Index data structures
			- [ ] Hash-based
			- [ ] Tree-based
		- [ ] 8.4 Comparisons of file organization models
			- [ ] 8.4.1 Cost Model
			- [ ] 8.4.2 Heap files
			- [ ] 8.4.3 Sorted files
			- [ ] 8.4.4 Clustered files
			- [ ] 8.4.5 Heap files with unclustered tree index
			- [ ] 8.4.6 Heap files with unclustered hash index
			- [ ] 8.4.7 I/O cost comparison

**Watch:**
-   Week 12 -  Storage and Indexing  - Intro
-   Week 12 -  Storage and Indexing  - File Organizations

**Lesson Slides:**
-   [[Week-12 and13-CptS451_10_Storage_and_Indexing.pdf| Week 12 & 13 - Storage and Indexing]]

**Activities:**
-   Homework 5 -- Design Theory and Normal Forms


## Week 13
---
> [!info]
> Learn about how DBMS stores persistent data. Understand why I/O cost is important for database operations and how does DBMS organize file records on disk to minimize the I/O cost. Learn the important properties of indexes. Understand how we use indexes to optimize the query performance for a given query workload.

**Readings:**
-   Textbook (Database Management Systems) -- Chapters 8, 9.5, 9.7, 20

**Watch:**
-   Week 13 -  Storage and Indexing  - Indexes
-   Week 13 -  Storage and Indexing  - Database Tuning

**Lesson Slides:**
-   [[Week-12 and13-CptS451_10_Storage_and_Indexing.pdf| Week 12 & 13 - Storage and Indexing]]

**Activities:**
-   None


## Week 14
---
> [!info]
> Work on the project milestone-3 and study for the final.

**Readings:**
-   None

**Watch:**
-   None

**Assignment:**
-   Homework 6 - Storage and Indexing
-   Work on project milestone-3


## Week 15
---
> [!info]
> Present your term project to the instructor. Take the final exam practice test.

**PowerPoint Slides:**
-   Project Demonstrations
-   Final Review
- [[CptS451_Final_Sample.pdf | Sample Final Exam]]
- [[CptS451_Final_Sample_solutions.pdf | Sample Final Exam Solution]]

**Assignments:**
-   Project Milestone 3
