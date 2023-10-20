*&---------------------------------------------------------------------*
*& Report z04_demo_04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_demo_04.

DATA text TYPE string VALUE 'Hello'.
DATA text2 TYPE string VALUE ' World'.
DATA text3 TYPE string.

text3 = text && ' ' && text2.
write: / text3.

text3 = |{ text } { text2 }|.
write: / text3.

write / |Länge von text3: { strlen( text3 ) }|.
