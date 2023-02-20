CREATE DATABASE YelpData;
CREATE TABLE IF NOT EXISTS Business (
    business_name   TEXT,
    business_id     TEXT PRIMARY KEY,
    isOpen          BOOLEAN,
    category        TEXT[],
    address         TEXT,
    city            TEXT,
    state           TEXT
);

CREATE TABLE IF NOT EXISTS YelpUser (
    user_id         TEXT PRIMARY KEY,
    review_count    INTEGER
);

CREATE TABLE IF NOT EXISTS Review (
    review_id       TEXT PRIMARY KEY,
    user_id         TEXT,
    business_id     TEXT,
    rating          FLOAT,
    FOREIGN KEY (business_id) REFERENCES Business (business_id),
    FOREIGN KEY (user_id) REFERENCES YelpUser (user_id)
);

CREATE TABLE CheckIn (
    business_id     TEXT PRIMARY KEY,
    day             TEXT,
    hour            TIME,
    num_checkins    INTEGER
    FOREIGN KEY business_id REFERENCES Business (business_id)
);

