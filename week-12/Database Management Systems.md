## I. Chapter 8, Storage & Indexing Overview
---
- [x] 8.1: cost of I/O

- 8.2 **File organizations & Indexing** (as a speedup method)
	- [ ] 8.2.1 Clustered Indexes
	- [ ] 8.2.2 Primary & Secondary Indexes
 
- 8.3 Index data structures
	- [ ] Hash-based
	- [ ] Tree-based

### Comparing file organizations
- Randomly ordered (heap file)
- sorted based on some attributes `<age, salary>`
- clustered B+ tree with search key `<age, salary>`
- Heap file with unclustered B+ tree index on `<age, salary>`
- Heap file with unclustered hash index on `<age, salary>`

#### Cost Model
- Scan
- Search with Equality Selection
- Search with Range Selection
- Insert a Record
- Delete a Record
 
#### Heap files

#### Sorted files

#### Clustered files

#### Heap files with unclustered tree index

#### Heap files with unclustered hash index
	
#### I/O cost comparison
| File Type                  | Scan        | Equality Search   | Range Search                       | Insert            | Delete    |
| -------------------------- | ----------- | ----------------- | ---------------------------------- | ----------------- | --------- |
| **Heap**                   | BD          | 0.5BD             | BD                                 | 2D                | Search+D  |
| **Sorted**                 | BD          | D$log_2$B         | D$log_2$B+ \#matching pages        | Search+BD         | Search+BD |
| **Clustered**              | 1.5BD       | D$log_F1.5$B      | $Dlog_F1.5$B+\#matching pages      | Search+D          | Search+D  |
| **Unclustered tree index** | BD(R+0.15)  | D(1+$log_F0.15$B) | D($log_F0.15$B+\#matching records) | D(3+$log_F0.15$B) | Search+2D |
| **Unclustered hash index** | BD(R+0.125) | 2D                | BD                                 | 4D                | Search+2D |