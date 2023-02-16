#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  
  #prompt service ID
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) SET_APPOINTMENT 1 ;;
    2) SET_APPOINTMENT 2 ;;
    3) SET_APPOINTMENT 3 ;;
    *) MAIN_MENU "I could not find that service. What whould you like today?" ;;
  esac
}

SET_APPOINTMENT() {
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED" | xargs)

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_ID ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) 
                        VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
else
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID" | xargs)
fi

echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME
NEW_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) 
                        VALUES($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME')")
if [[ -z NEW_APPOINTMENT_RESULT ]]
then
  echo -e "\nAppointment isn't created."
else
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}

MAIN_MENU
