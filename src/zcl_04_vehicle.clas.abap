CLASS zcl_04_vehicle DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Attribute "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA make TYPE string READ-ONLY.
    DATA model TYPE string READ-ONLY.
    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Methoden "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    METHODS constructor
      IMPORTING
        make_i  TYPE string
        model_i TYPE string.

    METHODS to_string ABSTRACT
      RETURNING VALUE(value) TYPE string.

    METHODS get_name ABSTRACT
      RETURNING VALUE(value) TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_vehicle IMPLEMENTATION.
  METHOD constructor.
    make = make_i.
    model = model_i.
    number_of_vehicles = number_of_vehicles + 1.
  ENDMETHOD.

ENDCLASS.
