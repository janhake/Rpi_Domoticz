cpuTemp0=$(cat /sys/class/thermal/thermal_zone0/temp)
cpuTemp1=$((cpuTemp0/1000))
OUTPUT=`curl "http://192.168.2.37:8080/json.htm?type=command&param=udevice&idx=18&nvalue=0&svalue=$cpuTemp1"` 
MEMUSG=`free -m | awk '/Mem:/ { print $3 }'`
#save memory usage to domoticz, replace with you IP, Portnumber and IDX
OUTPUT=`curl "http://192.168.2.37:8080/json.htm?type=command&param=udevice&idx=27&nvalue=0&svalue=$MEMUSG"` 

