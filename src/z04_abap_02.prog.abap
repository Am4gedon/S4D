*&---------------------------------------------------------------------*
*& Report z04_abap_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_abap_02.

parameters p_knr type S_CUSTOMER.
parameters p_name type S_CUSTNAME.
parameters p_city type CITY.
parameters p_cntry type S_COUNTRY.

write:  (**) p_knr, (*) p_name, (*) p_city, '(' NO-GAP, (*) p_cntry NO-GAP, ')' NO-GAP.
