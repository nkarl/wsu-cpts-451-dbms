#Relational-model

> [!tip]
> 1. **Requirements Analysis**
> 2. **Conceptual DB Design**
> *3. **Logical DB Design**: conversion into a schema
> 	- pick a type of DBMS, most popularly relational DBMS*
> 4. **Schema Refinement**
> 5. **Physical DB Design**
>6. **Application/Security Design**


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
1. Domain
2. Key
3. Entity Identity
4. Foreign Key

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
> - A primary key cannot contain a NULL value.

#### 4. Foreign Key Constraints


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