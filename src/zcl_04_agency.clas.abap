CLASS zcl_04_agency DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  methods constructor
  importing name type string.
  methods add_partner
  importing partner type ref to zif_04_partner.
  methods to_string
  RETURNING VALUE(result) type string.
  PROTECTED SECTION.
  PRIVATE SECTION.
  data: partners type table of ref to zif_04_partner,
        name type string.
ENDCLASS.



CLASS zcl_04_agency IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_partner.
    APPEND partner TO me->partners.
  ENDMETHOD.


  METHOD to_string.
    DATA: result_string   TYPE string,
          partner_string  TYPE string,
          first_iteration TYPE abap_bool VALUE abap_true.

    LOOP AT me->partners INTO DATA(partner).
      partner_string = partner->get_name( ).

      IF first_iteration = abap_true.
        result_string = partner_string.
        first_iteration = abap_false.
      ELSE.
        result_string = |{ result_string }, { partner_string }|.
      ENDIF.
    ENDLOOP.

    result = result_string.
  ENDMETHOD.

ENDCLASS.
