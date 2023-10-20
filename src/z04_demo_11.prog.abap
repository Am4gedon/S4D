*&---------------------------------------------------------------------*
*& Report z04_demo_11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_demo_11.

DATA connection TYPE z00_connection.
DATA flight TYPE z00_flight.
DATA flight_with_connection TYPE z00_flight_with_connection.

connection-carrier_id = 'ID'.
connection-connection_id = '0400'.
connection-departure_city = 'FRANKFURT'.
connection-arrival_city = 'NEW YORK'.

flight-carrier_id = 'LH'.
flight-connection_id = '0400'.
flight-flight_date = sy-datum.
flight-price = 69.
flight-currency_code = 'EUR'.

flight_with_connection = corresponding #( connection ).
