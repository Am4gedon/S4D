*&---------------------------------------------------------------------*
*& Report z04_demo_12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_demo_12.

**********************************************************************
* Deklaration interner Tabellen *
**********************************************************************
DATA connections TYPE z04_connections. "TYPE [ Tabellentyp ]
DATA connections2 TYPE TABLE OF z04_connection. "TYPE TABLE OF [ Strukturtyp ]

**********************************************************************
* Hinzufügen von Datensätzen *
**********************************************************************
connections = VALUE #(
( carrier_id = 'LH' connection_id = '0400' arrival_city = 'BING CHILLING')
( carrier_id = 'UA' departure_city = 'NEW YORK' )
( carrier_id = 'LH' arrival_city = 'FRANKFURT' )
( )
).

connections = VALUE #( BASE connections (  carrier_id = 'AA' connection_id = '0017' arrival_city = 'ROME' ) ).

APPEND VALUE #( connection_id = '0401' ) TO connections.

DATA connection TYPE z04_connection.
connection-arrival_city = 'MADRIN'.
connection-departure_city = 'BERLIN'.

APPEND connection TO connections.
connections = VALUE #( BASE connections ( connection ) ).

**********************************************************************
* Lesen von Datensätzen *
**********************************************************************
"Lesen eines Einzelsatzes
IF line_exists( connections[ 1 ] ).
  connection = connections[ 1 ]. "Index
ENDIF.
TRY.
    connection = connections[ carrier_id = 'AA' connection_id = '0017' ]. "Komponenten
  CATCH cx_sy_itab_line_not_found.
ENDTRY.

"Lesen mehrerer Datensätze
LOOP AT connections INTO connection WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  WRITE / connection.
ENDLOOP.

**********************************************************************
* Ändern von Datensätzen *
**********************************************************************
"Ändern eines Einzelsatzes
connections[ 1 ]-departure_city = 'FRANKFURT'. "Index
connections[ carrier_id = 'AA' connection_id = '0017' ]-departure_city = 'WALLDORF'. "Komponenten

"Ändern mehrerer Datensätze
DATA connection_ref TYPE REF TO z04_connection.

LOOP AT connections REFERENCE INTO connection_ref WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  connection_ref->carrier_id = 'LHD'.
ENDLOOP.

**********************************************************************
* Sortieren
**********************************************************************
SORT connections BY carrier_id DESCENDING connection_id ASCENDING departure_city DESCENDING.

**********************************************************************
* Löschen *
**********************************************************************
"Löschen einzelner Datensätze
DELETE connections INDEX 4.

"Löschen mehrerer Datensätze
DELETE connections WHERE arrival_city IS NOT INITIAL.

**********************************************************************
* Größe
**********************************************************************
write / lines( connections ).

WRITE ''.
