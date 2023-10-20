*&---------------------------------------------------------------------*
*& Report z06_demo_09
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_demo_09.

**********************************************************************
* Defintionen und Deklarationen
**********************************************************************
PARAMETERS p_cid TYPE s_carr_id.
PARAMETERS p_chckbx AS CHECKBOX.

PARAMETERS p_opt1 RADIOBUTTON GROUP opts.
PARAMETERS p_opt2 RADIOBUTTON GROUP opts.
PARAMETERS p_opt3 RADIOBUTTON GROUP opts.

**********************************************************************
* Eingabeprüfungen
**********************************************************************
AT SELECTION-SCREEN.
  IF p_chckbx = 'X'. "IF p_chckbx abap_true
    MESSAGE e000(z06) WITH sy-uname.
  ENDIF.

**********************************************************************
* Hauptverarbeitung
**********************************************************************
START-OF-SELECTION.
  CASE abap_true.
    WHEN p_opt1.
      WRITE 'Option 1 gesetzt'.
    WHEN p_opt2.
      WRITE 'Option 2 gesetzt'.
    WHEN P_opt3.
      WRITE 'Option 3 gesetzt'.
  ENDCASE.
