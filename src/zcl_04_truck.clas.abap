CLASS zcl_04_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_04_vehicle
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        make_i        TYPE string
        model_i       TYPE string
        cargo_in_tons TYPE i.
    METHODS to_string REDEFINITION.
    METHODS get_name REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA cargo_in_tons TYPE i.
ENDCLASS.



CLASS zcl_04_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make_i = make_i model_i = model_i ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    value = |{ make } { model } Cargo in tons: { cargo_in_tons }|.
  ENDMETHOD.


  METHOD get_name.
    value = |{ make } { model }|.
  ENDMETHOD.

ENDCLASS.
