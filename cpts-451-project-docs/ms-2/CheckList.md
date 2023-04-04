- MI-02
	1. Revise database schema (from MI-01)
	2. Translate revised ER to DDL SQL (CREATE TABLE)
	3. Populate database
		- Embed INSERT statement inside JSON parsing code
			- execute one by one as you generate them.
			- write INSERT statements to a script file and then run this script file.
	4. Retrieve information on the database's tables.a
		- `SELECT COUNT(*) FROM table_name;` for each table
		- Copy results to `CharlesNguyen_TableSizes.txt`
	5. Calculate and update for each business:
		- numCheckins
		- reviewCount
		- reviewRating
	6. Write 2-page paper to describe proposed metrics for classifying businesses as popular or successful.
		- Popular businesses that seem to attract more customers compared to other businesses in the same category.
		- Successful businesses which have been serving the community for a long time and which have loyal customers.

- Review
	- [x] database schema
		- business
		- checkin
		- review
		- user (possibly needed for analysis)
	- [x] parser code
- Revise
	- [x] database schema
	- [x] parser code

## Review
### Data
##### Business
```json
{
    "business_id": "duHFBe87uNSXImQmvBh87Q",
    "name": "Blimpie",
    "neighborhood": "",
    "address": "4719 N 20Th St",
    "city": "Phoenix",
    "state": "AZ",
    "postal_code": "85016",
    "latitude": 33.5059283,
    "longitude": -112.0388474,
    "stars": 4.5,
    "review_count": 10,
    "is_open": 0,
    "attributes": {
        "RestaurantsTableService": false,
        "GoodForMeal": {
            "dessert": false,
            "latenight": false,
            "lunch": false,
            "dinner": false,
            "breakfast": false,
            "brunch": false
        },
        "Alcohol": "none",
        "Caters": true,
        "HasTV": false,
        "RestaurantsGoodForGroups": true,
	        "NoiseLevel": "quiet",
        "WiFi": "no",
        "RestaurantsAttire": "casual",
        "RestaurantsReservations": false,
        "OutdoorSeating": false,
        "BusinessAcceptsCreditCards": true,
        "RestaurantsPriceRange2": 1,
        "BikeParking": true,
        "RestaurantsDelivery": false,
        "Ambience": {
            "romantic": false,
            "intimate": false,
            "classy": false,
            "hipster": false,
            "divey": false,
            "touristy": false,
            "trendy": false,
            "upscale": false,
            "casual": false
        },
        "RestaurantsTakeOut": true,
        "GoodForKids": true,
        "BusinessParking": {
            "garage": false,
            "street": false,
            "validated": false,
            "lot": false,
            "valet": false
        }
    },
    "categories": ["Sandwiches", "Restaurants"],
    "hours": {}
}
```

##### Checkin
```json
{
    "time": {
        "Friday": {
            "20:00": 2,
            "19:00": 1,
            "22:00": 10,
            "21:00": 5,
            "23:00": 14,
            "0:00": 2,
            "18:00": 2
        },
        "Thursday": {
            "23:00": 1,
            "0:00": 1,
            "19:00": 1,
            "18:00": 1,
            "16:00": 2,
            "22:00": 2
        },
        "Wednesday": {
            "17:00": 2,
            "23:00": 3,
            "16:00": 1,
            "22:00": 1,
            "19:00": 1,
            "21:00": 1
        },
        "Sunday": {
            "16:00": 2,
            "17:00": 2,
            "19:00": 1,
            "22:00": 4,
            "21:00": 4,
            "0:00": 3,
            "1:00": 2
        },
        "Saturday": {
            "21:00": 4,
            "20:00": 3,
            "23:00": 10,
            "22:00": 7,
            "18:00": 1,
            "15:00": 2,
            "16:00": 1,
            "17:00": 1,
            "0:00": 8,
            "1:00": 1
        },
        "Tuesday": {
            "19:00": 1,
            "17:00": 1,
            "1:00": 2,
            "21:00": 1,
            "23:00": 3
        },
        "Monday": { "18:00": 2, "23:00": 1, "22:00": 2 }
    },
    "business_id": "dwQEZBFen2GdihLLfWeexA"
}
```

##### Review
```json
{
    "review_id": "ClgrKJ6dqiM7vSKJBJ2w6Q",
    "user_id": "T5MGS0NHBCWgofZ6Q6Btng",
    "business_id": "dwQEZBFen2GdihLLfWeexA",
    "stars": 4,
    "date": "2013-06-03",
    "text": "I've been here at least 5 times now and each time is better than the last. I Iove what they have done to improve the building and add outdoor dining. Service is always good here and on par with other top places in Mentor. I really suggest the chicken soup on a cold day it's very yummy! Everything I've had on the menu has been great.",
    "useful": 0,
    "funny": 0,
    "cool": 0
}
```

##### User
```json
{
    "average_stars": 3.94,
    "compliment_cool": 1556,
    "compliment_cute": 211,
    "compliment_funny": 1556,
    "compliment_hot": 1285,
    "compliment_list": 101,
    "compliment_more": 134,
    "compliment_note": 1295,
    "compliment_photos": 162,
    "compliment_plain": 2134,
    "compliment_profile": 74,
    "compliment_writer": 402,
    "cool": 40110,
    "elite": [
        2014, 2017, 2011, 2012, 2015, 2009, 2013, 2007, 2016, 2006, 2010, 2008
    ],
    "fans": 835,
    "friends": [
        "U_sn0B-HWdTSlHNXIl_4XA",
        "pnfVIB7UhvCQ7X2K0Q2XIw",
		...
    ],
    "funny": 10882,
    "name": "Andrea",
    "review_count": 2559,
    "useful": 83681,
    "user_id": "om5ZiponkpRqUNa3pVPiRg",
    "yelping_since": "2006-01-18"
}
```

### Parser Code


## Revise
