CLASS zcl_04_carrier DEFINITION

PUBLIC
CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_04_partner.

    METHODS: constructor IMPORTING name TYPE string,
      add_airplane IMPORTING airplane TYPE REF TO zcl_04_airplane,
      get_biggest_cargo_plane RETURNING VALUE(result) TYPE REF TO zcl_04_cargo.

  PROTECTED SECTION.
    DATA: name TYPE string.
    DATA: airplanes TYPE TABLE OF REF TO zcl_04_airplane.
ENDCLASS. "cl_carrier DEFINITION

CLASS zcl_04_carrier IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD. "constructor

  METHOD add_airplane.
    APPEND airplane TO me->airplanes.
  ENDMETHOD. "add_airplane

  METHOD get_biggest_cargo_plane.
    DATA: largest_cargo     TYPE i VALUE 0,
          lr_cargo_airplane TYPE REF TO zcl_04_cargo.

    "Loop through all airplanes
    LOOP AT me->airplanes INTO DATA(lr_airplane).
      "Check if the airplane is a cargo airplane
      TRY.
          DATA(lr_cargo) = CAST zcl_04_cargo( lr_airplane ).

          "Check capacity
          IF lr_cargo->get_cargo( ) > largest_cargo.
            largest_cargo = lr_cargo->get_cargo( ).
            lr_cargo_airplane = lr_cargo.
          ENDIF.

        CATCH cx_sy_move_cast_error.
          CONTINUE.
      ENDTRY.
    ENDLOOP.

    result = lr_cargo_airplane.

  ENDMETHOD. "get_biggest_cargo_plane

  METHOD zif_04_partner~to_string.
    DATA: result_string   TYPE string,
          airplane_string TYPE string,
          first_iteration TYPE abap_bool VALUE abap_true.

    LOOP AT me->airplanes INTO DATA(airplane).
      airplane_string = airplane->to_string( ).

      IF first_iteration = abap_true.
        result_string = |{ airplane_string }|.
        first_iteration = abap_false.
      ELSE.
        result_string = |{ result_string }, { airplane_string }|.
      ENDIF.
    ENDLOOP.

    result = result_string.
  ENDMETHOD. "to_string

  method zif_04_partner~get_name.
         result = |{ me->name }|.
  endmethod.
ENDCLASS. "cl_carrier IMPLEMENTATION
