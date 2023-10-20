*&---------------------------------------------------------------------*
*& Report z04_demo_14
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_demo_14.

DATA connection TYPE spfli. "Struktur
DATA connections TYPE TABLE OF spfli. "Interne Tabelle

DATA carrier_id TYPE s_carr_id VALUE 'LH'.
DATA connection_id TYPE s_conn_id VALUE '0400'.

* SQL Standard
* SELECT [Spalte 1], [Spalte 2]...
*   FROM [Datenbanktabelle]
*   WHERE [Bedingung]

* Open SQL
* SELECT FROM [Datenbanktabelle]
*   FIELDS [Spalte 1], [Spalte 2]...
*   WHERE [Bedingung]
*   INTO [Zielvariable].

**********************************************************************
* Lesen eines Einzelsatzes
**********************************************************************
SELECT SINGLE FROM spfli
  FIELDS *
  WHERE carrid = @carrier_id AND connid = @connection_id
  INTO @connection.
IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.

**********************************************************************
* Lesen mehrerer Datensätze
**********************************************************************
SELECT FROM spfli
  FIELDS *
  WHERE airpfrom = 'FRA'
  INTO TABLE @connections.
IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_structure_name = 'SPFLI'
  TABLES
    t_outtab         = connections.


**********************************************************************
* Zielvariablen " *
**********************************************************************
"Angabe einer passenden Zielvariablen
DATA connection2 TYPE z04_connection.

SELECT SINGLE FROM spfli
    FIELDS carrid, connid, cityfrom, cityto
    WHERE carrid = @carrier_id AND connid = @connection_id
    INTO @connection2.
IF sy-subrc <> 0.
  MESSAGE 'No Connection Found' TYPE 'E'.
ENDIF.
