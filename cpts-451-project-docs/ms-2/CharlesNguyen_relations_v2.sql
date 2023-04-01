CREATE DATABASE YelpData;
CREATE TABLE IF NOT EXISTS Business (
    business_id     TEXT PRIMARY KEY,
    business_name   TEXT NOT NULL,
    city            TEXT,
    state           TEXT,
    address         TEXT,
    zipcode         TEXT,
    isOpen          BOOLEAN DEFAULT FALSE,
    category        TEXT[],
    num_checkins    INTEGER DEFAULT 0,
    review_rating   FLOAT DEFAULT 0.0
);

CREATE TABLE IF NOT EXISTS YelpUser (
    user_id         TEXT PRIMARY KEY,
    review_count    INTEGER DEFAULT 0 NOT NULL
);

CREATE TABLE IF NOT EXISTS Review (
    review_id       TEXT,
    user_id         TEXT,
    business_id     TEXT,
    rating          FLOAT DEFAULT 0.0,
    text            TEXT,
    PRIMARY KEY (review_id, user_id, business_id),
    FOREIGN KEY (business_id)   REFERENCES Business (business_id),
    FOREIGN KEY (user_id)       REFERENCES YelpUser (user_id)
);

CREATE TABLE CheckIn (
    business_id     TEXT,
    day             TEXT,
    time            TIME,
    checkin_count   INTEGER,
    PRIMARY KEY (business_id),
    FOREIGN KEY (business_id)   REFERENCES Business (business_id)
);

