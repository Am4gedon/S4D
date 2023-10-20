*&---------------------------------------------------------------------*
*& Report z04_demo_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_demo_03.

DATA: result_i TYPE i,
      result_p TYPE p DECIMALS 4.

result_i = 5 + 3.
WRITE: / |5 + 3 = { result_i }|. "Addition

result_i = 5 - 3.
WRITE: / |5 - 3 = { result_i }|. "Subtraktion

result_i = 5 * 3.
WRITE: / |5 * 3 = { result_i }|. "Multiplikation

result_p = 5 / 3.
WRITE: / |5 / 3 = { result_p }|. "Division

result_i = 5 DIV 3.
WRITE: / |5 DIV 3 = { result_i }|. "Division

result_i = 5 MOD 3.
WRITE: / |5 MOD 3 = { result_i }|. "Division

**********************************************************************
* Zuweisungsoperatoren*
**********************************************************************
result_i = result_i + 1.
result_i += 1.
ADD 1 TO result_i.
WRITE: / |3fache Inkrementierung: { result_i }|.

**********************************************************************
* Numerische Funktionen*
**********************************************************************
result_i = abs( -5 ).
WRITE: / |abs( -5 ) = { result_i }|.

result_p = round( val = '420.1337' dec = 2 ).
write: / |{ result_p }| no-zero.
