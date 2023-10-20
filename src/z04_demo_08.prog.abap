*&---------------------------------------------------------------------*
*& Report z04_demo_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_demo_08.

**********************************************************************
* Definitionen und Deklarationen *
**********************************************************************
PARAMETERS p_cid TYPE s_carr_id.
PARAMETERS p_chckbx AS CHECKBOX.

PARAMETERS p_op1 RADIOBUTTON GROUP bruh.
PARAMETERS p_op2 RADIOBUTTON GROUP bruh.
PARAMETERS p_op3 RADIOBUTTON GROUP bruh.

**********************************************************************
* Dynamische Vorbelegungen
**********************************************************************
INITIALIZATION.
  IF sy-langu = 'E'.
    p_chckbx = abap_true.
  ENDIF.

**********************************************************************
* Eingabeprüfung *
**********************************************************************
AT SELECTION-SCREEN ON p_chckbx.
  IF p_chckbx = 'X'.
    MESSAGE e000(z04) WITH sy-uname.
  ENDIF.

**********************************************************************
* Hauptverarbeitung *
**********************************************************************
START-OF-SELECTION.
  CASE abap_true.
    WHEN p_op1.
      WRITE 'Option 1'.
    WHEN p_op2.
      WRITE 'Option 2'.
    WHEN p_op3.
      WRITE 'Option 3'.
  ENDCASE.
