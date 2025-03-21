free_space=$(free -mt | grep "Total" | awk '{print $4}')  #This command is used to display the free RAM memory 
min_ram=500   # min RAM value
if [[ $free_space -lt $min_ram ]]  # Comparing  the  free_space and min_ram 
then 
 echo "WARNING, Ram is running low"
else
 echo "RAM Space is sufficinet - $free_space MB  "
 echo "RAM Space is sufficinet - $((free_space/1024)) GB  " 


 fi