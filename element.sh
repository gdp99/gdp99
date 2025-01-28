#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


if [[ $1 ]]
then
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
    if [[ -z $ELEMENT ]]
    then
      ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    fi
  else
    ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  fi
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    ELEMENT_PROP=$($PSQL "SELECT name, symbol, properties.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties LEFT JOIN types ON properties.type_id=types.type_id LEFT JOIN elements ON properties.atomic_number=elements.atomic_number WHERE properties.atomic_number=$ELEMENT")
    echo "$ELEMENT_PROP" | while IFS=\| read NAME SYMBOL ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
else
  echo "Please provide an element as an argument."
fi
