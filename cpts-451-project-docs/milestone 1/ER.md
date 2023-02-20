## I. Use Cases: Search by Location
---
### 1. LOCATE by (state, city, zipcode)
*User SELECT a (state, city and zipcode)*.

When the search button is pressed,
- the businesses in that (state, city, zipcode) are displayed
	- for each business,  return the following information:
		- Business name
		- Address and city
		- number of reviews provided for the business
		- Average rating (stars) the reviews for the business
		- Total check-ins


### 2. REFINE by zipcode
---
*Nested within Use Case #1*.

When the user SELECT a zipcode (in use case #1), display the following information:
- total number of business in that zipcode
- total population of the zipcode
- the average income of the employees in the zipcode


### 3. REFINE by category
---
*User REFINE results (from use case 2) by category*.

The search will return the businesses of that category.


## II. Analyzing and Indentifying Popular & Successful Businesses
---
- *Analyzing the business properties*, and
- *Identifying the businesses* classified in one of the following groups
	- **Popular businesses** that seem to attract more customers compared to other businesses in the same category.
		- `review_count`
		- `is_open`
		- `check_in`
	- **Successful businesses** which,
		- have been serving the community for a long time, and
		- have loyal customers.
			- `review_count`
			- `is_open`
			- `check_in`
			- `stars > 4.5`

Available data:
- business
- checkin
- review
- user