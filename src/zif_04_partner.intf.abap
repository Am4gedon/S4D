INTERFACE zif_04_partner
  PUBLIC .
  METHODS:
    to_string
      RETURNING VALUE(result) TYPE string,

    get_name
      RETURNING VALUE(result) TYPE string.
ENDINTERFACE.
