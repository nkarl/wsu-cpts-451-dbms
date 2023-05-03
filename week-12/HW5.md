## Charles Nguyen -- 011606177
## CptS 451 HW5


### Question 1: Identifying Functional Dependencies

There are two BCNF tables:

##### MySales_product

```sql
SELECT COUNT(*) FROM (SELECT DISTINCT pname FROM mysales) AS MS1;
SELECT DISTINCT pname, price FROM mysales;
```

```sql
CREATE TABLE mysales_product (
	pname TEXT,
	price INTEGER
);

INSERT INTO mysales_product (pname, price)
SELECT pname, price FROM mysales;

SELECT COUNT(*) FROM mysales_product;
```

##### MySales_monthly_discount

```sql
SELECT COUNT(*) FROM (SELECT DISTINCT month FROM mysales) AS MS2;
SELECT DISTINCT month, discount FROM mysales;
```

```sql
CREATE TABLE mysales_monthly_discount (
	month TEXT,
	discount TEXT
);

INSERT INTO mysales_monthly_discount (month, discount)
SELECT month, discount FROM mysales;

SELECT COUNT(*) FROM mysales_monthly_discount;
```

<div style="page-break-after:always;" > </div>

#### Question 2: BCNF Decomposition

##### Part 1.
$$
\begin{align}
&R(A, B, C, D, E, F)\cr
&A \rightarrow BC &\quad(1)\cr
&D \rightarrow AF &\quad(2)\cr
\end{align}
$$
- decompose R
	- (1) $\{A\}^+ = \{A,B,C\}$
		- A is not a key
		- not in BCNF
		 - compute $R1(A,B,C)$
			 - A is the key
	- (2) $\{D\}^+ = \{D,A,B,C,F\}$
		- D is not a key
		- not in BCNF
		- compute R2(A,B,C,D,F)
			- D is the key

B, C, E are not on the LHS, safely ignored.

|     | A   | B   | C   | D   | E   | F   |
| --- | --- | --- | --- | --- | --- | --- |
| A   |     | B   | C   |     |     |     |
| D   | A   |     |     |     |     | F   |
|     |     |     |     |     |     |     |

Applying reflexivity.

|     | A   | B   | C   | D   | E   | F   |
| --- | --- | --- | --- | --- | --- | --- |
| A   | *A* | B   | C   |     |     |     |
| D   | A   |     |     | *D* |     | F   |
|     |     |     |     |     |     |     |

Applying transivity.

|     | A   | B     | C     | D   | E   | F   |
| --- | --- | ----- | ----- | --- | --- | --- |
| A   | *A* | B     | C     |     |     |     |
| D   | A   | **B** | **C** | *D* |     | F   |
|     |     |       |       |     |     |     |

- $\{A\}^+ = \{A,B,C\}$ 
- $\{A,D\}^+ = \{A,B,C,D\}$ 
- $\{A,D,E\}^+ = \{A,B,C,D,E\}$ 
- $\{A,D,E,F\}^+ = \{A,B,C,D,E,F\}$ is *key*
  
- $\{D\}^+ = \{A,B,C,D,F\}$
- $\{D,E\}^+ = \{A,B,C,D,E,F\}$ is *key*

<div style="page-break-after:always;" ></div>

##### Part 2.
$$
\begin{align}
&S(A, B, C, D)\cr
&ABC \rightarrow D &\quad(1)\cr
&D \rightarrow A &\quad(2)\cr
\end{align}
$$

|     | A   | B   | C   | D   |
| --- | --- | --- | --- | --- |
| A   |     |     |     |     |
| ABC |     |     |     | D   |
| B   |     |     |     |     |
| C   |     |     |     |     |
| D   | A   |     |     |     |
|     |     |     |     |     |

Applying reflexivity.

|     | A   | B   | C   | D   |
| --- | --- | --- | --- | --- |
| A   | *A* |     |     |     |
| ABC | *A* | *B* | *C* | D   |
| B   |     | *B* |     |     |
| C   |     |     | *C* |     |
| D   | A   |     |     | *D* |
|     |     |     |     |     |

Applying transivity.

|     | A   | B     | C     | D   | 
| --- | --- | ----- | ----- | --- |
| A   | *A* |       |       |     |
| ABC | *A* | *B*   | *C*   | D   |
| B   |     | *B*   |       |     |
| C   |     |       | *C*   |     |
| D   | A   | **B** | **C** | *D* |
|     |     |       |       |     |

- $\{A,B,C\}^+ = \{A,B,C,D\}$ is *key*, in BCNF

- $\{D\}^+ = \{A,D\}$ *not in BCNF*
- $\{B,C,D\}^+ = \{A,B,C,D\}$ is *key*

