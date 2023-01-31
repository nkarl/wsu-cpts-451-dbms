The basic query syntax:

```sql
SELECT [DISTINCT: optional] `select-list`
FROM                        `from-list`
WHERE                       `qualification`
```

- `from-list` in FROM: *a list of table names*
	- can be suffixed by a *range variable*, which is useful when the same table name repeats in the list
- `select-list` in SELECT: *a list of expressions involving column names* (of tables named in the from-list)
	- column name can be prefixed by a *range variable*
- `qualification` in WHERE: *boolean combination of conditions* of the form
	- `expression OP expression`, where
		- `OP`: one of the operators $\{\lt, \leq, =, <>, \geq, \gt\}$
		- `expression`:
			- a column name, or
			- a constant, or
			- an arithmetic or string expression