CLASS zcl_04_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_04_vehicle
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        make_i          TYPE string
        model_i         TYPE string
        number_of_seats TYPE i.

    METHODS to_string REDEFINITION.

    METHODS get_name REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA number_of_seats TYPE i.
ENDCLASS.



CLASS zcl_04_car IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make_i = make_i model_i = model_i ).
    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD to_string.
    value = |{ make } - { model } Number of seats: { number_of_seats }|.
  ENDMETHOD.


  METHOD get_name.
    value = |{ make } { model }|.
  ENDMETHOD.

ENDCLASS.
