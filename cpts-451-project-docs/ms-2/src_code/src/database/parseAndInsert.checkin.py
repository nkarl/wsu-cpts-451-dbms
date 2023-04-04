import json
import psycopg2


def cleanStr4SQL(s) -> str:
    return s.replace("'", "`").replace("\n", " ")


def int2BoolStr(value):
    if value == 0:
        return 'False'
    else:
        return 'True'


def insert2BusinessTable():
    # reading the JSON file
    test_data = './Yelp-CptS451/test/checkin.JSON'
    real_data = './Yelp-CptS451/yelp_checkin.JSON'
    with open(real_data, 'r') as f:
        # TODO: update path for the input file
        # outfile =  open('./yelp_business.SQL', 'w')  #uncomment this line if you are writing the INSERT statements to an output file.
        line = f.readline()
        count_line = 0

        # connect to yelpdb database on postgres server using psycopg2
        # TODO: update the database name, username, and password
        conn = psycopg2.connect(
                dbname="yelpdb",
                user="postgres",
                password="pass1234",
                host="localhost"
            )
        try:
            cur = conn.cursor()
        except psycopg2.OperationalError as e:
            print('{} - connection will be reset'.format(e))
            print('Unable to connect to the database!')
            if conn:
                if cur:
                    cur.close()
                conn.close()
            conn = None
            cur = None

        conn = psycopg2.connect(
                "dbname='yelpdb' user='postgres' host='localhost' password='pass1234'")
        cur = conn.cursor()

        while line:
            data = json.loads(line)
            business_id = data['business_id']
            for (dayofweek, time) in data['time'].items():
                for (hour, count) in time.items():
                    checkin_str = "'" + business_id + "',"  \
                                  "'" + dayofweek + "'," + \
                                  "'" + hour + "'," + \
                                  str(count)
                    sql_str = "INSERT INTO checkin (business_id,day,time,num_checkins) " \
                        "VALUES (" \
                        + checkin_str \
                        + ");"
                    try:
                        cur.execute(sql_str)
                    except:
                        print("INSERT INTO business TABLE failed!")
                    conn.commit()
                    # optionally you might write the INSERT statement to a file.
                    # outfile.write(sql_str)
                    print(sql_str)

            line = f.readline()
            count_line += 1

        cur.close()
        conn.close()

    print(count_line)
    # outfile.close()  #uncomment this line if you are writing the INSERT statements to an output file.
    f.close()


insert2BusinessTable()
