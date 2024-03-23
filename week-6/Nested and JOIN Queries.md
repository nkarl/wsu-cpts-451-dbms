#nested #subqueries #duplicates #join

## I. Subqueries
---
- Also called *subqueries*.
- Embedded inside an *outer* query.
- Similar to function calls in programming languages.
- The keyword `IN` allows selecting an attribute from subqueries.

Let's say, *we are looking for the employees that work for the same department as Jack.* The following expressions are equivalent:

```sql
SELECT E1.ename, E1.dno
FROM   Emp as E1
WHERE  E1.dno IN
	(SELECT E2.dno
	 FROM   Emp E2
	 WHERE  E2.ename='Jack');
```

```sql
SELECT E2.ename, E2.dno
FROM   Emp AS E1, Emp AS E2
WHERE  E1.ename='Jack' AND E1.dno=E2.dno;
```

### Applied Cases
#### nested in FROM

#### to AGGREGATE in multiple stages

#### JOIN-ing sub-queries


## II. JOIN
---
- **Week6-L1 (1:10:00)**

> [!important]
>
> JOIN can be done in two ways:
> - *implicit* using SELECT-FROM-WHERE
> 	- tables are joined by the WHERE conditions
> - *explicit* using JOIN-ON *expressions*

```sql
--syntax
SELECT (column_list)
FROM   table_name
	[INNER | {LEFT | RIGHT | FULL} OUTER] JOIN table_name
	ON <condition>
WHERE . . .
```
