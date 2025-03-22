# variablese
Base=directory_location
Days=10
Depth=1
Run=0

# checking if directory is present or not
if [! -d $Base]
then
 echo "directory does not exist: $Base"
 exit 1
fi

# create 'achive' folder if not present
if [ ! -d $Base/archive]
then
 mkdir $Base/archive

fi


#  find the list of files larger than 20MB
#Find the list of files larget than 20MB
for i in `find $BASE -maxdepth $DEPTH -type f -size +20MB`
 do
  if [ $Run -eq 0 ] 
  then
    
    echo "[$(date "+%Y-%m-%d %H : %M : %S" )] archiving $i == > $Base/archive"
    gzip $i || exit 1
    mv $i.gz $BASE/archive || exit 1
  fi
done
