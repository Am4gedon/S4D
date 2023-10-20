*&---------------------------------------------------------------------*
*& Report z00_abap_07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_abap_07.

PARAMETERS p_cid TYPE s_carr_id.
PARAMETERS p_coid TYPE s_conn_id.
PARAMETERS p_date TYPE s_date.
PARAMETERS p_bid TYPE s_book_id.

DATA booking_with_customer TYPE zabap_booking_with_customer.

TRY.
    booking_with_customer = zcl_00_helper=>get_booking_with_customer(
                              carrier_id    = p_cid
                              connection_id = p_coid
                              flight_date   = p_date
                              booking_id    = p_bid ).
  CATCH zcx_no_booking_found INTO DATA(e1).
    MESSAGE e1->get_text( ) TYPE 'E'.
  CATCH zcx_no_customer_found INTO DATA(e2).
    MESSAGE e2->get_text( ) TYPE 'E'.
ENDTRY.

WRITE booking_with_customer.
