PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $# -eq 0 ]]
then

echo Please provide an element as an argument.

else
  VAR=$1

if [[ $VAR =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$($PSQL "Select atomic_number from elements where atomic_number=$VAR")
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo I could not find that element in the database.
  else
    SYMBOL=$($PSQL "Select symbol from elements where atomic_number=$ATOMIC_NUMBER")
    NAME=$($PSQL "Select name from elements where atomic_number=$ATOMIC_NUMBER") 
     TYPE_ID=$($PSQL "Select type_id from properties where atomic_number=$ATOMIC_NUMBER")
     if [[ $TYPE_ID == 1 ]]
     then
        TYPE=nonmetal
    else
        if [[ $TYPE_ID == 2 ]]
        then
           TYPE=metal
        else
     if [[ $TYPE_ID == 3 ]]
       then
       TYPE=metalloid
      fi
      fi
      fi
MASS=$($PSQL "Select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
MELTING_POINT=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
BOILING_POINT=$($PSQL "Select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
else
  if [[ ${#VAR} -le 2 ]]
  then
    SYMBOL=$($PSQL "Select symbol from elements where symbol ILIKE '$VAR'")
    if [[ -z $SYMBOL ]]
    then
      echo I could not find that element in the database.
    else
      ATOMIC_NUMBER=$($PSQL "Select atomic_number from elements where symbol='$SYMBOL'")
      NAME=$($PSQL "Select name from elements where symbol='$SYMBOL'")
       TYPE_ID=$($PSQL "Select type_id from properties where atomic_number=$ATOMIC_NUMBER")
        if [[ $TYPE_ID == 1 ]]
     then
        TYPE=nonmetal
    else
        if [[ $TYPE_ID == 2 ]]
        then
           TYPE=metal
        else
     if [[ $TYPE_ID == 3 ]]
       then
       TYPE=metalloid
      fi
      fi
      fi
MASS=$($PSQL "Select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
MELTING_POINT=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
BOILING_POINT=$($PSQL "Select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  else
    NAME=$($PSQL "Select name from elements where name='$VAR'")
    if [[ -z $NAME ]]
    
    then
      echo I could not find that element in the database. 
    else
    ATOMIC_NUMBER=$($PSQL "Select atomic_number from elements where name='$NAME'")
    SYMBOL=$($PSQL "Select symbol from elements where name='$NAME'")
     TYPE_ID=$($PSQL "Select type_id from properties where atomic_number=$ATOMIC_NUMBER")
     if [[ $TYPE_ID == 1 ]]

     then
        TYPE=nonmetal
     else
        if [[ $TYPE_ID == 2 ]]
        then
           TYPE=metal
        else
     if [[ $TYPE_ID == 3 ]]
       then
       TYPE=metalloid
      fi
      fi
      fi
MASS=$($PSQL "Select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
MELTING_POINT=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
BOILING_POINT=$($PSQL "Select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  fi

fi
 
fi
