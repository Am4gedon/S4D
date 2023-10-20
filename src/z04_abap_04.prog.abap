*&---------------------------------------------------------------------*
*& Report z04_abap_04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_abap_04.

DATA customer_data TYPE zabap_customer.
PARAMETERS  cust_id TYPE s_customer.
customer_data = zcl_abap_helper=>get_customer( customer_id =  cust_id ).
WRITE customer_data.
