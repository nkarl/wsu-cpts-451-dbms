#relation-algebra

## I. Definition
---
Similar to the ER model, Relational Algebra has the basic model and extended model.

More formally,

> [!abstract] Definition
> relational algebra is a branch of math that deals with *algebraic operations (consisting of operands and operators) that represent relations*.
>  - as a query language for relations
>  - theoretical foundation for SQL
>
> The returned relations must have:
> - closure
> - composibility


## II. Operations
---
### BASIC Relational Algebra
- [[#Set Operations]]
- [[#Selection]]
- [[#Projection]]
- [[#Cartesian Products]]
- [[#Joins]]
- [[#Renaming]]

#### Set Operations
Relation must have the same schema.
- Union $\boldsymbol{\cup}$
- intersection $\boldsymbol{\cap}$
- difference $\boldsymbol{-}$

#### Selection
> [!info] Selection
> $$\sigma_{Condition}(\text{R})$$
> Return tuples in R that satisfies a condition C.

#### Projection
> [!info] Project
> $$\Pi_{A_1\dots A_k}(\text{R})$$
> Picks columns of attributes $[A_1, \dots A_k]$ of R.

##### Extended Projection
> [!info] Extended Projection
> $$\Pi_{A_1, A_2 + A_3 \rightarrow B}(\text{R})$$
> The attribute list may contain arbitrary expression involving attributes:
> 1. Arithmetic operations on attributes, e.g. $A_1 + A_2 \rightarrow B$
> 2. Duplicate occurences of the same attributes.

#### Cartesian Products
> [!info] Cartesian Product $\times$
> $$\text{R}\times\text{S}$$
> Pairs each tuple **r** in **R** with each tuple **s** in **S**.
> - Schema of result is the attributes of R and then S, *in order*.
> - If attributes *A* exists both in R and S then use `R.A` and `S.A`.

#### Joins
> [!info] Join $\bowtie$
> $$\text{R}\bowtie_{C}\text{S} = \sigma_C(\text{R}\times\text{S})$$

##### Theta-Join

$$\DeclareMathOperator*{\ThetaJoin}{ThetaJoin}R\ThetaJoin_{R.A>S.C}S$$
$$\DeclareMathOperator*{\ThetaJoin}{ThetaJoin}R\ThetaJoin_{R.A>S.C, R.B\neq S.D}S$$
##### Equi-Join
- Equi-Join: **C** only uses the equality operator
$$\DeclareMathOperator*{\EquiJoin}{EquiJoin}R\EquiJoin_{R.B=S.D}S$$
 ##### Natural-Join
- Connects two relations by:
	- equating attributes of the same name (equi-join), and
	- projecting out one copy of each of equated attributes.
- We have relations **R** and **S**,
	- Let *L* be the union of their attributes
	- Let $A_1\dots A_k$ be their common attributes
 
$$\DeclareMathOperator*{\NaturalJoin}{NaturalJoin}R\NaturalJoin S = \Pi_L(R\NaturalJoin_{R.A_1=S.A_1,\cdots R.A_k=S.A_k}S)$$
`Emp(name, dept)`
| Dept    | Name |
| ------- | ---- |
| Physics | Jack |
| EECS    | Tom  |
`Contact(name, addr)`
| Name | Addr    |
| ---- | ------- |
| Jack | Pullman |
| Tom  | Moscow  |
| Mary | Colfax  |
`Emp` $\bowtie$ `Contact`
| Dept    | Name | Addr    |
| ------- | ---- | ------- |
| Physics | Jack | Pullman |
| EECS    | Tom  | Moscow  |

#### Renaming
- **Renaming** of *relations* and *attributes* $\boldsymbol{\rho}$

### EXTENDED Relational Algebra
- [[#Outer-Joins]]
- [[#Grouping / Aggregation]]

#### Outer-Joins
- Outer-Join
- Full Outer-Join
- Left Outer-Join
- Right Outer-Join

#### Grouping / Aggregation
- Duplicate Elimination $\boldsymbol{\delta}$
- Sorting $\boldsymbol{\tau}$
- Grouping and Aggregation $\boldsymbol{\gamma}$
- Outer-Joins



## III. Building Complex Operations
---
### Notation Styles for Complex Expressions
1. Arithmetic style
2. Sequences of assignments statements
3. Expression trees

#### 1. Arithmetic
$$\DeclareMathOperator*{\NaturalJoin}{NaturalJoin}R\NaturalJoin S = \Pi_L(R\NaturalJoin_{R.A_1=S.A_1,\cdots R.A_k=S.A_k}S)$$

$$
R\cap S = R - (R - S)
$$

##### Precedence
1. () parenthesis
2. \[$\sigma$, $\Pi$, \rho\]
3. \[$\times$, $\bowtie$\]
4. \[$\cap$\]
5. \[$\cup$, $-$\]

#### 2. Sequence
$$
\Pi_{balance} \left(\sigma_{custsmm=ssn}(account \times (\sigma_{name=tom}customer))\right)
$$
where,
$$
\begin{align}
R_1(ssn, name, city) &:= \sigma_{name=tom}(customer)\cr
R_2(ssn, name, city, custssn, balance) &:=\sigma_{custssn=ssn}(account\times R_1)\cr
Result(balance) &:=\Pi_{balance}(R_2)
\end{align}
$$

#### 3. Expression Tree
```mermaid
graph TD
	PJ[PROJECT balance] --- EJ[EQUI-JOIN custSSN=SSN]
	EJ --- account
	EJ --- SELECT[SELECT name='Tom']
	SELECT --- customer
```

## IV. Limitations
---
- Some queries cannot be represented
	- Recursive queries
- More expressive languages needed
