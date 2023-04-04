-- CREATE DATABASE YelpDB;

CREATE TABLE IF NOT EXISTS Business (
    business_id     TEXT PRIMARY KEY,
    name            TEXT NOT NULL,
    address         TEXT,
    state           TEXT,
    city            TEXT,
    zipcode         TEXT,
    stars           FLOAT DEFAULT 0.0,
    num_reviews     INTEGER DEFAULT 0,
    num_checkins    INTEGER DEFAULT 0,
    is_open         BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS Review (
    review_id       TEXT,
    business_id     TEXT,
    stars           FLOAT DEFAULT 0,
    text            TEXT,
    PRIMARY KEY (review_id, business_id),
    FOREIGN KEY (business_id)   REFERENCES Business (business_id)
);

CREATE TABLE CheckIn (
    business_id     TEXT,
    day             TEXT,
    time            TIME,
    num_checkins    INTEGER,
    PRIMARY KEY (business_id),
    FOREIGN KEY (business_id)   REFERENCES Business (business_id)
);

