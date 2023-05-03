#indexing #clustered-index #primary-index #secondary-index #hash-indexing #tree-indexing #B-plus-tree #heap-file-with-unclustered-B-plus-tree #heap-file-w-unclustered-hash

## I. Chapter 8, Storage & Indexing Overview
---
- [x] 8.1: cost of I/O

- 8.2 **File organizations & Indexing** (as a speedup method)
	- [x] 8.2.1 Clustered Indexes
	- [x] 8.2.2 Primary & Secondary Indexes
 
- 8.3 Index data structures
	- [x] Hash-based
	- [x] Tree-based

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

- $B$ is the *number of data pages fully packed with records*.
- $R$ is the *number of records per page*.
- D is the *average I/O time on a disk page*.
- C is the *average time to process a record*.
	- for example, to compare a field value to a selection constant.

| File Type             | Scan          | Equal. Search     | Range Search                | Insert            | Delete |
| --------------------- | ------------- | ----------------- | --------------------------- | ----------------- | ------ |
| Heap                  | $BD$          | $0.5BD$           | $BD$                        | $2D$              | $S+D$  |
| Sorted                | $BD$          | $Dlog_2B$         | $Dlog_2B+B_{matched}$       | $S+BD$            | $S+BD$ |
| Clustered Tree Idx.   | $1.5BD$       | $D log_F1.5B$     | $Dlog_F1.5B +B_{matched}$  | $S+D$             | $S+D$  |
| Unclustered Tree Idx. | $BD(R+0.15)$  | $D(1+log_F0.15B)$ | $D(log_F0.15B+R_{matched})$ | $D(3+log_F0.15B)$ | $S+2D$ |
| Unclustered Hash Idx. | $BD(R+0.125)$ | $2D$              | $BD$                        | $4D$              | $S+2D$ |


| File Type          | Good                                                                             | Bad                           |
| ------------------ | -------------------------------------------------------------------------------- | ----------------------------- |
| Heap               | *efficient storage*                                                              | unordered                     |
|                    | *fast* scan                                                                      | *slow* search                 |
|                    | *fast* insert                                                                    | *slow* delete                 |
|                    |                                                                                  |                               |
| Sorted             | *efficient storage*                                                              |                               |
|                    | (*faster search than clustered* on sequential retrieval of large amount of rec.) | *slow* insert                 |
|                    |                                                                                  |                               |
| Clustered          | *efficient storage*                                                              | space overhead (but worth it) |
|                    | *fast* search                                                                    |                               |
|                    |                                                                                  |                               |
| Unclustered T.Idx. | *fast* search                                                                    | *slow* scan                   |
|                    | *fast* insert                                                                    | *slow* range-search           |
|                    | *fast* delete                                                                    |                               |
|                    |                                                                                  |                               |
| Unclustered H.Idx. | *fast* search                                                                    | *slow* scan                   |
|                    | *fast* insert                                                                    | ~~range-search~~              |
|                    | *fast* delete                                                                    |                               |
|                    | *faster eq. search than hash*                                                    |                               |
|                    |                                                                                  |                               |
