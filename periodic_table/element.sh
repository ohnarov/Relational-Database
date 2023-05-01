#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c";

MAIN() {
  ELEMENT=$1
  #GET_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements WHERE name = '$ELEMENT' OR atomic_number = '$ELEMENT' OR symbol = '$ELEMENT'")
  GET_ELEMENT_RESULT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
                              FROM elements AS "e"
                              FULL JOIN properties AS "p"
                              ON e.atomic_number = p.atomic_number
                              WHERE 
                              CAST(e.atomic_number AS VARCHAR) = '$ELEMENT' 
                              OR e.name = '$ELEMENT' 
                              OR e.symbol = '$ELEMENT';")
  echo "$GET_ELEMENT_RESULT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR MASS BAR MELTING BAR BOILING
  do
    if [[ -z $GET_ELEMENT_RESULT ]]
    then
      echo -e "I could not find that element in the database."
    else
      #echo "$ATOMIC_NUMBER | $SYMBOL | $NAME"
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    fi
  done
}

# check if user provided element
if [[ $1 ]]
then
  #echo -e "\n$1"
  MAIN $1
else
  echo -e "Please provide an element as an argument."
fi