#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Bike Rental Shop ~~~~~\n"

MAIN_MENU() {
  echo -e "Welcome to My Salon, how can I help you?\n"
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME" 
  done
  read SERVICE_ID_TO_RENT
  #get service availability
  SERVICE_AVAILABILITY=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_TO_RENT")
      #if not available
      if [[ -z $SERVICE_AVAILABILITY ]]
      then
      #send to main menu
        MAIN_MENU 
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$PHONE_NUMBER'")
        #if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
        #get new customer name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          #insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
        fi
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$PHONE_NUMBER'")
        echo -e "\nWhat time?"
        read SERVICE_TIME
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_TO_RENT,'$SERVICE_TIME')")
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_TO_RENT")
        echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      fi

  
exit 1
}
MAIN_MENU