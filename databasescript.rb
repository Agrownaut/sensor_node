#!/usr/bin/ruby
require 'sqlite3'
require "dht-sensor-ffi"


db = SQLite3::Database.new( "firstTest.db" )

db.execute("create table if not exists 'tempreadings' (id INTEGER,Temperature DOUBLE,Humidity DOUBLE,ReadingTime DATETIME);")

val = DhtSensor.read(4, 22) # pin=4, sensor type=DHT-22
puts val.temp # => 21.899999618530273 (temp in C)
puts val.temp_f # => 71.4199993133545 (temp in F)
puts val.humidity # => 22.700000762939453 (relative humidity %)

sql_string = "insert into 'tempreadings' (Temperature, Humidity, ReadingTime) values (#{val.temp_f}, #{val.humidity}, datetime('now'))"
puts sql_string

db.execute(sql_string)
