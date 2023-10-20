CLASS zcl_04_cargo DEFINITION
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
        cargo_in_tons TYPE i.
    METHODS get_cargo RETURNING VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA cargo_in_tons TYPE i.
ENDCLASS.



CLASS zcl_04_cargo IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name_i = name_i type_i = type_i ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
   value = |{ me->get_name( ) } { me->get_plane_type( ) } / Load: { cargo_in_tons }|.
  ENDMETHOD.

  METHOD get_cargo.
    result = cargo_in_tons.
  ENDMETHOD.

ENDCLASS.
