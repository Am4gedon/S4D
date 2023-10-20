CLASS zcl_04_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_04_partner.

    METHODS: constructor IMPORTING name TYPE string,
      add_vehicle IMPORTING vehicle TYPE REF TO zcl_04_vehicle.

  PROTECTED SECTION.
    DATA: name TYPE string.
    DATA: vehicles TYPE TABLE OF REF TO zcl_04_vehicle.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_rental IMPLEMENTATION.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_vehicle.
    APPEND vehicle TO me->vehicles.
  ENDMETHOD.

  METHOD zif_04_partner~to_string.
    DATA: result_string   TYPE string,
          vehicle_string  TYPE string,
          first_iteration TYPE abap_bool VALUE abap_true.

    LOOP AT me->vehicles INTO DATA(vehicle).
      vehicle_string = vehicle->get_name( ).

      IF first_iteration = abap_true.
        result_string = |{ vehicle_string }|.
        first_iteration = abap_false.
      ELSE.
        result_string = |{ result_string }, { vehicle_string }|.
      ENDIF.
    ENDLOOP.

    result = result_string.
  ENDMETHOD.
  method zif_04_partner~get_name.
         result = |{ me->name }|.
  endmethod.



ENDCLASS.
