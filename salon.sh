#! /bin/bash
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=salon -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
fi

echo "~~~~~ MY SALON ~~~~~"

echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU(){

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\n1) cut \n2) color\n3) perm \n4) style \n5) trim "
  read SERVICE_ID_SELECTED
  
  case $SERVICE_ID_SELECTED in
    1) BOOK_SERVICE $SERVICE_ID_SELECTED;;
    2) BOOK_SERVICE $SERVICE_ID_SELECTED;;
    3) BOOK_SERVICE $SERVICE_ID_SELECTED;;
    4) BOOK_SERVICE $SERVICE_ID_SELECTED;;
    5) BOOK_SERVICE $SERVICE_ID_SELECTED;;
    *) MAIN_MENU "I could not find that service. What would you like today?";;
  esac

}

BOOK_SERVICE(){
  if [[ $1 ]]
  then
    SERVICE_ID_SELECTED=$1
  fi

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT CUSTOMER_ID FROM CUSTOMERS WHERE PHONE='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "Insert into customers(phone,name) values ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
    CUSTOMER_ID=$($PSQL "SELECT CUSTOMER_ID FROM CUSTOMERS WHERE PHONE='$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$($PSQL "SELECT name FROM CUSTOMERS WHERE PHONE='$CUSTOMER_PHONE'")
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
    CHECK_APPT=$($PSQL "Select appointment_id from appointments where customer_id=$CUSTOMER_ID and service_id=$SERVICE_ID_SELECTED
    and time='$SERVICE_TIME'")
    if [[  -z $CHECK_APPT ]]
    then
      INSERT_APPT=$($PSQL "Insert into appointments(customer_id,service_id,time) values ('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      echo -e "\nYou already have this appointment booked."
    fi
  
}


MAIN_MENU