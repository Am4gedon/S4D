*&---------------------------------------------------------------------*
*& Report z04_demo_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_demo_10.

**********************************************************************
* Deklaration von Strukturen *
**********************************************************************
Data connection type Z04_CONNECTION.

**********************************************************************
* Zugriff auf Strukturkomponenten *
**********************************************************************
connection-carrier_id = 'LH'.
connection-connection_id = '0400'.
connection-departure_id = 'Frankfurt'.
connection-arrival_city = 'New York'.

write: connection-carrier_id, connection-connection_id.
