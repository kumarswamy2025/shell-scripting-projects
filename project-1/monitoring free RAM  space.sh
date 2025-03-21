free_space=$(free -mt | grep "Total" | awk '{print $4}')
min_ram=500
if [[ $free_space -lt $min_ram ]]
then 
 echo "WARNING, Ram is running low"
else
 echo "RAM Space is sufficinet - $free_space MB  "
 echo "RAM Space is sufficinet - $((free_space/1024)) GB  " 


 fi