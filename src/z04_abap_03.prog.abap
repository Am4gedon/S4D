*&---------------------------------------------------------------------*
*& Report z04_abap_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_abap_03.

**********************************************************************
* Definitionen und Deklarationen *
**********************************************************************
TYPES ty_decimal TYPE p LENGTH 16 DECIMALS 2.

PARAMETERS: p_num1 TYPE ty_decimal,
            p_num2 TYPE ty_decimal,
            p_oper TYPE c LENGTH 1.

DATA: result TYPE ty_decimal.

**********************************************************************
* Eingabeprüfung *
**********************************************************************
AT SELECTION-SCREEN.
  IF p_oper = '' OR p_num1 = '' OR p_num2 = ''.
    MESSAGE e000(z04).
  ENDIF.

AT SELECTION-SCREEN ON p_oper.
  IF p_oper <> '+' AND p_oper <> '-' AND p_oper <> '*' AND p_oper <> '/' AND p_oper <> '%' AND p_oper <> '^'.
    MESSAGE e002(z04). "Invalid Operand
  ENDIF.

AT SELECTION-SCREEN ON p_num2.
  IF p_oper = '/' AND p_num2 = '0'.
    MESSAGE e001(z04). " Can't divide with 0
  ENDIF.

**********************************************************************
* Hauptverarbeitung *
**********************************************************************

START-OF-SELECTION.
  CASE p_oper.
    WHEN '+'.
      result = p_num1 + p_num2.
    WHEN '-'.
      result = p_num1 - p_num2.
    WHEN '*'.
      result = p_num1 * p_num2.
    WHEN '/'.
      result = p_num1 / p_num2.
    WHEN '%'.
      result = zcl_04_calculator=>calculate_percentage( base_value = p_num1 percentage = p_num2 ).
    WHEN '^'.
      result = zcl_abap_calculator=>calculate_power( base = p_num1 exponent = p_num2 ).
ENDCASE.
WRITE: / 'Ergebnis:', result.
