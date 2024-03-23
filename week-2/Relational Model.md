#Relational-model

> [!tip] DB Design Program
> 1. Requirements Analysis
> 2. Conceptual DB Design
> 3. **Logical DB Design:** *conversion into a schema*
> 	- *decide on a type of DBMS*
> 		- *relational DBMS are popular*
> 1. Schema Refinement
> 2. Physical DB Design
>6. Application/Security Design


## I. Model
---
### Definition
- **Table**: ***relation***
	- **Table header**: ***relation schema***
	- **Column header**: ***attribute***
		- has a *domain*
		- is *atomic*
	- **Row**: ***tuple/entity***

Example: relation: Employee

| **ssno**    | **name**        | **salary** |
| ----------- | --------------- | ---------- |
| 111-11-1111 | John Yates      | 80,000     |
| 222-22-2222 | Vasiliy Bunakov | 40,000     |

### Integrity Constraints over Relations
> [!info]
> Integrity constraints allow database designers to semantically speficy the conditions on a database schema, which implement the rules for the valid data that can be stored in the databse. 

#### 1. Domain Constraints
> [!info]
> The range of values an attribute is allowed to have.

#### 2. Key Constraints
> [!info]
> - There are usually multiple keys, called **candidate keys**
> - All attributes always form a key
> - A **minimal key** is an atomic key (i.e. it has no proper subset)

#### 3. Entity Identity Constraints
> [!info]
> - Some fields are too important to have a NULL value.
> - A primary key *disallows a NULL value*.

#### 4. Foreign Key Constraints
- inclusion dependencies (generalization of the foreign key constraints)
- specified between two relations to maintain correspondence between their respective tuples

> [!summary] Definition
> Relation schemas: **R** and **S**
> **R** has a primary key **K** (a set of attributes)
> **S** has a *foreign key* **FK** (a set of attributes) if:
> > 1. **FK** and **K** have the same domains
> > 2. values for **FK** in each tuple **s** in **S** either:
> > 	- occur as values of **K** of a tuple in **r** of **R**, or
> > 	- **FK** is NULL
>
> **FK** is a foreign key that refers to the primary key **K** of **R**

##### Inclusion Dependencies
- Generalization of foreign key constraints
	- Inclusion dependency $S[Y_1\dots Y_n]\subseteq R[X_1\dots X_n]$ means *values in S refer to values in R*.
	- **Foreign key is an inclusion dependency**,
		- in which $\{X_1\dots X_n\}$ is *the primary key* of R.


## II. SQL
---
### Definition
> [!summary] 
> - SQL is a declarative language.
> 	- **Say “what to do”** rather than “how to do it.”
> 	- *Avoid a lot of data-manipulation details needed in procedural languages* like C++ or Java.
> - Database management system figures out “best” way to execute query.
> 	- Called “query optimization.”

- ****Data definition Language (DDL)***
	- allows users to *create the relations and constraints*.
- ****Data Manipulation Language (DML)***
	- Query Language
		- declarative
			- *you specify what you want and not how to retrieve*
		- easy to learn and program
	- Updates
		- insert
		- delete
		- update tables
- Other commands
	- View definition language
		- commands to define rules
		- updates through views generally not supported
	- *Transaction Control*
		- *commands to specify beginning and end of transactions*.

### Implementation
> [!warning] Circular Reference on Foreign-Key Constraints
> - [[week-2-CptS451_3_RelationalModel.pdf|page 39]]
>
> **It's important to be aware of circular references**. Circular reference is best to avoid, because it complicates the INSERT and UPDATE operations. For example, we can only insert a new tuple into a table (either referencing or referenced) *if the tuple with value already **exists** its counterpart table*. Otherwise, we have to set the inserted value to NULL and update it after.

#### Choosing a Policy for Foreign-Key Constraints
Write the statement `ON [DELETE, UPDATE] [CASCADE, SET NULL, NO ACTION, REJECT]` to the end of the CREATE statement.

*The default policy is* `REJECT`.

```sql
CREATE TABLE emp
(
	ssn INT,
	name VARCHAR(20),
	dno INT,
	FOREIGN KEY dno REFERENCES dept(dept#)
	ON DELETE SET NULL
	ON UPDATE CASCADE 
);
```
