*&---------------------------------------------------------------------*
*& Report z04_demo_06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_demo_06.

WHILE sy-index <= 10.
  WRITE / sy-index.
ENDWHILE.

DO 10 TIMES.
  WRITE / 'Bameninghong'.
ENDDO.
