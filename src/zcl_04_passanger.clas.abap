CLASS zcl_04_passanger DEFINITION
  PUBLIC
  INHERITING FROM zcl_04_airplane
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: to_string REDEFINITION.
    METHODS constructor
      IMPORTING
        name_i          TYPE string
        type_i          TYPE string
        number_of_seats TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA number_of_seats TYPE i.
ENDCLASS.



CLASS zcl_04_passanger IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name_i = name_i type_i = type_i ).
    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD to_string.
   value = |{ me->get_name( ) } - { me->get_plane_type( ) } / Amount of seats: { number_of_seats }|.
  ENDMETHOD.

ENDCLASS.
