#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c";

echo -e "\n~~Salon Appointment Scheduler~~"

MAIN_MENU(){
  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo -e "\nWhich service do you want?"
  echo "$SERVICES" | sed 's/ |/)/g'
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU
  else
    SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_SELECTED ]]
    then
      MAIN_MENU
    else
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_NAME ]]
      then
        echo -e "\nWhat's your name"
        read CUSTOMER_NAME
        INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      echo -e "\nWhat time do you want to book?"
      read SERVICE_TIME
      
      INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU
