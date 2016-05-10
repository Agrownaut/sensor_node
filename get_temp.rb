require 'date'
# Version 0.1
# Function to get and save locally
# a temperature reading from the sensor

temp = `/opt/vc/bin/vcgencmd measure_temp`
savedtemp = temp[5..-4].to_f
time = DateTime.now
puts time
output = "#{savedtemp}, #{time}\n"


tempfile = File.open("temperatures", "a")
tempfile.write(output)
tempfile.close
