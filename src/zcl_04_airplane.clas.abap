CLASS zcl_04_airplane DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        name_i TYPE string
        type_i TYPE string.

    METHODS to_string ABSTRACT
      RETURNING VALUE(value) TYPE string.

    METHODS: get_name RETURNING VALUE(result) TYPE string,
      get_plane_type RETURNING VALUE(result) TYPE string.
    CLASS-METHODS get_number RETURNING VALUE(result) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Attribute "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA name TYPE string.
    DATA plane_type TYPE string.
    CLASS-DATA number_of_airplanes TYPE i.
ENDCLASS.



CLASS zcl_04_airplane IMPLEMENTATION.


  METHOD constructor.
    name = name_i.
    plane_type = type_i.
    number_of_airplanes = number_of_airplanes + 1.
  ENDMETHOD.

  METHOD get_name.
    result = name.
  ENDMETHOD.

  METHOD get_plane_type.
    result = plane_type.
  ENDMETHOD.

  METHOD get_number.
    result = number_of_airplanes.
  ENDMETHOD.

ENDCLASS.
