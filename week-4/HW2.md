<div align=center>
<h3>Washington State University</h3>
<h3>School of Electrical Engineering and Computer Science</h3>
<h3>CptS 451 – Introduction to Database Systems</h3>
<h3>Online</h3>
<p>Dr. Sakire Arslan Ay</p>
<br>
<h1>Homework-2</h1>
<br>
<h1>ER to Relational Translation</h1>
<br>
<p>Name: CHARLES NGUYEN</p>
<p>Student Number: 011606177</p>
<table style="text-align: center; width:300px; height:100px">
	<tr>
		<th>Question</th>
		<th>Max Points</th>
		<th>Score</th>
	</tr>
	<tr>
		<td>1</td>
		<td>70</td>
		<td></td>
	</tr>
		<td>2</td>
		<td>30</td>
		<td></td>
	<tr>
		<td>Total</td>
		<td>100</td>
		<td></td>
	</tr>
</table>
</div>

<div style="page-break-after: always"></div>

#### Question 1 (70 pts)
---
##### Entity Sets
1. Doctor
```sql
CREATE TABLE Doctor(
	phySSN      CHAR(11) PRIMARY KEY,
	doctor_name VARCHAR(50),
	specialty   VARCHAR(256),
	experience  INTEGER,
	clinic_name VARCHAR(50) NOT NULL,
	clinic_city VARCHAR(50) NOT NULL,
	FOREIGN KEY (clinic_name, clinic_city)
		 REFERENCES Clinic(clinic_name, clinic_city)
)
```

2. Patient
```sql
CREATE TABLE Patient(
	SSN          CHAR(11) PRIMARY KEY,
	patient_name VARCHAR(50),
	doctor_name  VARCHAR(50) NOT NULL,
	age          INTEGER,
	address      VARCHAR(100),
	FOREIGN KEY (doctor_name) REFERENCES Doctor(doctor_name)
)
```

3. Clinic
```sql
CREATE TABLE Clinic(
	clinic_name  VARCHAR(50),
	clinic_city  VARCHAR(50),
	PRIMARY KEY  (clinicName, clinicCity)
)
```

<div style="page-break-after: always"></div>

4. Pharmacy
```sql
CREATE TABLE Pharmacy(
	pharm_name   VARCHAR(50) PRIMARY KEY,
	phone_num    CHAR(11),
	online       VARCHAR(100),
	instore      VARCHAR(100),
)
```

5. DrugCompany
```sql
CREATE TABLE DrugCompany(
	comp_name    VARCHAR(50) PRIMARY KEY,
	phone_num    CHAR(11)
)
```

6. Drug
```sql
CREATE TABLE Drug(
	drug_name    VARCHAR(50),
	formula      VARCHAR(50),
	comp_name    VARCHAR(50),
	PRIMARY KEY  (drug_name, comp_name)
	FOREIGN KEY (comp_name) REFERENCES DrugCompany(comp_name)
)
```

7. Prescription
```sql
CREATE TABLE Prescription(
	pres_num     BIGINT,
	patient_ssn  CHAR(11)    NOT NULL,
	doctor_name  CHAR(50)    NOT NULL,
	clinic_name  VARCHAR(50),
	clinic_city  VARCHAR(50),
	date         DATE,
	PRIMARY KEY (pres_num, clinic_name, clinic_city),
	FOREIGN KEY (clinic_name, clinic_city)
		 REFERENCES Clinic(clinic_name, clinic_city)
)
```

<div style="page-break-after: always"></div>

##### Relationship Sets
DrugMarket
```sql
CREATE TABLE DrugMarket(
	pharm_name   VARCHAR(50),
	drug_name    VARCHAR(50),
	comp_name    VARCHAR(50),
	price        FLOAT,
	PRIMARY KEY (pharm_name, drug_name, comp_name),
	FOREIGN KEY (pharm_name) REFERENCES Pharmacy(pharm_name),
	FOREIGN KEY (drug_name, company)
		 REFERENCES Drug(pharm_name, comp_name)
)
```

Contract
```sql
CREATE TABLE Contract()
	pharm_name       VARCHAR(50),
	comp_name        VARCHAR(50),
	text_link        VARCHAR(100),
	supervisor       VARCHAR(50),
	start_date       DATE,
	end_date         DATE,
	PRIMARY KEY      (pharm_name, comp_name),
	FOREIGN KEY (pharm_name) REFERENCES Pharmacy(pharm_name),
	FOREIGN KEY (comp_name) REFERENCES DrugCompany(comp_name)
)
```

<div style="page-break-after: always"></div>

#### Question 2 (30 pts)
---
##### a. (10 pts)
For the operations given below, *indicate whether execution of the operation would violate some “primary key” or “integrity constraints”*. If your answer is yes, specify the constraints (from the above list) that would be violated.

i) Insert tuple (a1, b10, d20, 35) into R3
- violates key constraint in R3
	- an instance of PRIMARY KEY (M=a1, N=b10, O=d20) already exists

ii) Insert tuple (s500, d20, 75) into R4
- legal

<div style="page-break-after: always"></div>

##### b. (15 pts)
For the operations given below, *indicate whether execution of the operation would violate any “foreign key constraints”*. If your answer is yes, specify the constraints (from the above list) that would be violated.
- Apply
	- “CASCADE” policy for delete operations, and
	- apply “SET NULL” policy for update operations.
- Update the tables after applying those policies.
	- (You may either redraw the tables or mention which tuples/attributes are deleted/updated at each table. For updates rewrite the updated tuples.)

Make the changes on the original tables for each operation below.

i) Delete tuple (d30, 150, 300) from R2
- Premises
	- R2: D
	- R2(D): referenced by R3(O)
- Result
	- Only R2 is altered, R3 does not contain any key instance referenced from R2

<table align=center style=" width:300px; height:100px">
	<tr>
		<th><u>D</u></th>
		<th>E</th>
		<th>F</th>
	</tr>
	<tr>
		<td>d10</td>
		<td>50</td>
		<td>100</td>
	</tr>
	<tr>
		<td>d20</td>
		<td>125</td>
		<td>200</td>
	</tr>
	<tr>
		<td>d40</td>
		<td>75</td>
		<td>400</td>
	</tr>
	<tr>
		<td>d50</td>
		<td>100</td>
		<td>200</td>
	</tr>
</table>

ii) Update tuple (s400, 30, 555) in R5 with values (6000, 60, 66)
- Premises
	- R5: S
	- R5(S): referenced by
		- R1(C)
		- R4(J)
- Evaluation
	- R1(C) references R5, but does not contain the instance C$\rightarrow$S(s400)
	- R4(J) references R5, but does not contains the instance J$\rightarrow$S(s400)
	- the value (6000) seems to violate the domain constraint on attribute S
		- does not start with the character 's'
- Result
	- Assuming that S=6000 is legal
	- only R5 is changed

<table align=center style=" width:300px; height:100px">
	<tr>
		<th><u>S</u></th>
		<th>T</th>
		<th>U</th>
	</tr>
	<tr>
		<td>s100</td>
		<td>20</td>
		<td>555</td>
	</tr>
	<tr>
		<td>s200</td>
		<td>20</td>
		<td>333</td>
	</tr>
	<tr>
		<td>s300</td>
		<td>30</td>
		<td>111</td>
	</tr>
	<tr>
		<td><strong>6000</strong></td>
		<td><strong>60</strong></td>
		<td><strong>66</strong></td>
	</tr>
	<tr>
		<td>s500</td>
		<td>40</td>
		<td>444</td>
	</tr>
</table>

iii) Update tuple (s100, 20, 555) in R5 with values (6000, 60, 666)
- Premises
	- R5: S
	- R5(S): referenced by
		- R1(C)
		- R4(J)
- Evaluation
	- R1(C) references R5, and contain the instance C$\rightarrow$S(s100)
	- R4(J) references R5, but does not contains the instance J$\rightarrow$S(s100)
	- the value (6000) seems to violate the domain constraint on attribute S
		- does not start with the character 's'
- Result
	- Assuming that S=6000 is legal
		- R5 is changed
		- R1 is changed
  
<table align=center style="width:300px; height:100px">
	<tr>
		<th>relation R5</th>
		<th><u>S</u></th>
		<th>T</th>
		<th>U</th>
	</tr>
	<tr>
		<td></td>
		<td>s100</td>
		<td>20</td>
		<td>555</td>
	</tr>
	<tr>
		<td></td>
		<td>s200</td>
		<td>20</td>
		<td>333</td>
	</tr>
	<tr>
		<td></td>
		<td>s300</td>
		<td>30</td>
		<td>111</td>
	</tr>
	<tr>
		<td></td>
		<td><strong>6000</strong></td>
		<td><strong>60</strong></td>
		<td><strong>66</strong></td>
	</tr>
	<tr>
		<td></td>
		<td>s500</td>
		<td>40</td>
		<td>444</td>
	</tr>
</table>

<table align=center style="width:300px; height:100px">
	<tr>
		<th>relation R1</th>
		<th><u>A</u></th>
		<th><u>B</u></th>
		<th>C</th>
	<tr>
	<tr>
		<td></td>
		<td>a1</td>
		<td>b10</td>
		<td><strong>6000</strong></td>
	</tr>
	<tr>
		<td></td>
		<td>a2</td>
		<td>b10</td>
		<td>s300</td>
	</tr>
	<tr>
		<td></td>
		<td>a2</td>
		<td>b20</td>
		<td>s200</td>
	</tr>
	<tr>
		<td></td>
		<td>a3</td>
		<td>b10</td>
		<td>s500</td>
	</tr>
	<tr>
		<td></td>
		<td>a4</td>
		<td>b20</td>
		<td><strong>6000</strong></td>
	</tr>
</table>

##### c.(5 pts)
If all tuples in R5 are deleted, what tuples will R2 and R3 contain?

R2 and R3 remain unchanged because they do not reference R5.
