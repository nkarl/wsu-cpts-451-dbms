## 0. Composition
---
> [!info]
> SQL uses *bag semantics*, i.e. SELECT queries do no remove duplicate rows.

- DDL: Data Definition Language (CREATE, ALTER, DROP TABLE)
- [[#I. The Basic Query Syntax|SQL: Sequel Query Language]]
- [[#II. Data Manipulation Language|DML: Data Manipulation Language]]
- [[#III. Triggers & Advanced Integrity Constraints|Triggers and Advanced Integrity Constraints]]

## I. The Basic Query Syntax
---
### Trivia
- *String matching* is possible with `LIKE` and an string expression containing the *one-or-more-char wildcard* `%` and/or the *single-char wildcard* `_`
- Watch out for NULL conditions
- `DISTINCT` keyword is optional
	- a constraint such that *the computed table should not contain duplicate rows*


### SELECT
```sql
SELECT [DISTINCT: optional] `select-list`
FROM                        `from-list`
WHERE                       `qualification`
```

- **from-list** in FROM: *a list of table names*
	- can be suffixed by a *range variable*, which is useful when the same table name repeats in the list
- **select-list** in SELECT: *a list of expressions involving column names* (of tables named in the from-list)
	- column name can be prefixed by a *range variable*
- **qualification** in WHERE: *boolean combination of conditions* of the form
	- *expression* `OP` *expression*, where
		- `OP`: one of the operators $\{\lt, \leq, =, <>, \geq, \gt\}$
		- *expression*:
			- a column name, or
			- a constant, or
			- an arithmetic or string expression
				- string can be compared lexicographically

> [!note] the **AS** keyword
> - Sometimes, we want to rename an attribute or relation/table, when the attribute name is not descriptive.
> ```sql
> SELECT ename, mgr AS manager
> FROM   Emp, Dept
> WHERE  Emp.dno = Dept.dno AND manager='Alice';
> ```
> - We can also add a new attribute as a column in the projected relation.
> ```sql
> SELECT ename, dno, 'temporary' AS status
> FROM   Emp
> WHERE  sal<50000;
> ```
> - When we need to query from the same table one or more times.
> 	- Week5-L1 26:20
> ```sql
> SELECT *
> FROM   Emp AS E1, Dept AS D, Emp AS E2
> WHERE  E1.dno = D.dno AND D.mgr=E2.ename;
> ```

#### Examples
We have the following table definitions (relations):
- Sailors(sid: `integer`, sname: `string`, rating: `integer`, age: `real`)
- Boats(bid: `integer`, bname: `string`, color: `string`)
- Reserves(sid: `integer`, bid: `integer`, day: `date`)

*An Instance **S3** of Sailors*
| sid | sname   | rating | age  |
| --- | ------- | ------ | ---- |
| 22  | Dustin  | 7      | 45.0 |
| 29  | Brutus  | 1      | 33.0 |
| 31  | Lubber  | 8      | 55.5 |
| 32  | Andy    | 8      | 25.5 |
| 58  | Rusty   | 10     | 35.0 |
| 64  | Horatio | 7      | 35.0 |
| 71  | Zorba   | 10     | 16.0 |
| 74  | Horatio | 9      | 35.0 |
| 85  | Art     | 3      | 25.5 |
| 95  | Bob     | 3      | 63.5 |

*An Instance **R2** of Reserves*
| sid | bid | day      |
| --- | --- | -------- |
| 22  | 101 | 10/10/98 |
| 22  | 102 | 10/10/98 |
| 22  | 103 | 10/8/98  |
| 22  | 104 | 10/7/98  |
| 31  | 102 | 11/10/98 |
| 31  | 103 | 11/6/98  |
| 31  | 104 | 11/12/98 |
| 64  | 101 | 9/5/98   |
| 64  | 102 | 9/8/98   |
| 74  | 103 | 9/8/98   |

*An Instance **B1** of Boats*
| bid | bname     | color |
| --- | --------- | ----- |
| 101 | Interlake | blue  |
| 102 | Interlake | red   |
| 103 | Clipper   | green |
| 104 | Marine    | red   |

##### Q1: Find the names of sailors who have reserved boat number 103
- Sailors
	- name: `sname`
- Reserves
- Boats
	- number: `bid = 103`

```sql
SELECT S.name
FROM   Sailors S, Reserves R
WHERE  S.sid = R.sid AND R.bid = 103
```

Order of operations:
1. apply a **Cartesian product**: *Sailors $\times$ Reserves*
2. apply conditions, and thus **JOIN**: `S.sid = R.sid AND R.bid = 103`
3. **select** (Projection) only the `sname` column


### UNION INTERSECT EXCEPT
> [!info]
> Uses *set semantics*, i.e. no duplicate rows.

##### UNION

##### INTERSECT

##### EXCEPT

##### Important Cases
###### R intersects (S unions T)
$$R\cap (S\cup T)$$

- postgres is straightforward
```sql
SELECT R.A FROM R
INTERSECT
( (SELECT S.A FROM S)
  UNION
  (SELECT T.A FROM T)
);
```

- or
```sql
(SELECT R.A FROM R, S WHERE R.A=S.A)
UNION
(SELECT R.A FROM R, T WHERE R.A=T.A);
```

- or, in standard SQL
```sql
SELECT R.A
FROM R, S, T -- produces an empty projection if one table is empty
WHERE R.A=S.A OR R.A=T.A;
```


### Aggregation & Grouping


## II. Data Manipulation Language
---
- INSERT
- DELETE
- UPDATE


## III. Triggers & Advanced Integrity Constraints
---