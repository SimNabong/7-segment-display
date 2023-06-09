TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

FUNCTION_BLOCK LOGGER
  VAR_INPUT
    TRIG : BOOL;
    MSG : STRING;
    LEVEL : LOGLEVEL := INFO;
  END_VAR
  VAR
    TRIG0 : BOOL;
  END_VAR

  IF TRIG AND NOT TRIG0 THEN
  {{
   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  }}
  END_IF;
  TRIG0:=TRIG;
END_FUNCTION_BLOCK



FUNCTION_BLOCK python_eval
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_poll
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_gear
  VAR_INPUT
    N : UINT;
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    py_eval : python_eval;
    COUNTER : UINT;
    _TMP_ADD10_OUT : UINT;
    _TMP_EQ13_OUT : BOOL;
    _TMP_SEL15_OUT : UINT;
    _TMP_AND7_OUT : BOOL;
  END_VAR

  _TMP_ADD10_OUT := ADD(COUNTER, 1);
  _TMP_EQ13_OUT := EQ(N, _TMP_ADD10_OUT);
  _TMP_SEL15_OUT := SEL(_TMP_EQ13_OUT, _TMP_ADD10_OUT, 0);
  COUNTER := _TMP_SEL15_OUT;
  _TMP_AND7_OUT := AND(_TMP_EQ13_OUT, TRIG);
  py_eval(TRIG := _TMP_AND7_OUT, CODE := CODE);
  ACK := py_eval.ACK;
  RESULT := py_eval.RESULT;
END_FUNCTION_BLOCK


PROGRAM SEVEN_SEGMENT_DISPLAY
  VAR_INPUT
    W : BOOL := 0;
    X : BOOL := 0;
    Y : BOOL := 0;
    Z : BOOL := 0;
  END_VAR
  VAR_IN_OUT
    A : BOOL;
  END_VAR
  VAR_OUTPUT
    B : BOOL;
    C : BOOL;
    DD : BOOL;
    EE : BOOL;
    F : BOOL;
    G : BOOL;
  END_VAR
  VAR
    _TMP_NOT18_OUT : BOOL;
    _TMP_OR14_OUT : BOOL;
    _TMP_NOT17_OUT : BOOL;
    _TMP_OR19_OUT : BOOL;
    _TMP_AND13_OUT : BOOL;
    _TMP_OR21_OUT : BOOL;
    _TMP_NOT16_OUT : BOOL;
    _TMP_OR20_OUT : BOOL;
    _TMP_AND22_OUT : BOOL;
    _TMP_OR23_OUT : BOOL;
    _TMP_OR24_OUT : BOOL;
    _TMP_AND25_OUT : BOOL;
    _TMP_OR28_OUT : BOOL;
    _TMP_AND35_OUT : BOOL;
    _TMP_OR29_OUT : BOOL;
    _TMP_OR30_OUT : BOOL;
    _TMP_OR31_OUT : BOOL;
    _TMP_AND32_OUT : BOOL;
    _TMP_OR33_OUT : BOOL;
    _TMP_AND34_OUT : BOOL;
  END_VAR

  _TMP_NOT18_OUT := NOT(Z);
  _TMP_OR14_OUT := OR(W, X, Y, _TMP_NOT18_OUT);
  _TMP_NOT17_OUT := NOT(X);
  _TMP_OR19_OUT := OR(_TMP_NOT17_OUT, Y, Z);
  _TMP_AND13_OUT := AND(_TMP_OR14_OUT, _TMP_OR19_OUT);
  A := _TMP_AND13_OUT;
  _TMP_OR21_OUT := OR(_TMP_NOT17_OUT, Y, _TMP_NOT18_OUT);
  _TMP_NOT16_OUT := NOT(Y);
  _TMP_OR20_OUT := OR(_TMP_NOT17_OUT, _TMP_NOT16_OUT, Z);
  _TMP_AND22_OUT := AND(_TMP_OR21_OUT, _TMP_OR20_OUT);
  B := _TMP_AND22_OUT;
  _TMP_OR23_OUT := OR(X, _TMP_NOT16_OUT, Z);
  C := _TMP_OR23_OUT;
  _TMP_OR24_OUT := OR(_TMP_NOT17_OUT, _TMP_NOT16_OUT, _TMP_NOT18_OUT);
  _TMP_AND25_OUT := AND(_TMP_OR24_OUT, A);
  DD := _TMP_AND25_OUT;
  _TMP_OR28_OUT := OR(_TMP_NOT17_OUT, Y);
  _TMP_AND35_OUT := AND(_TMP_OR28_OUT, _TMP_NOT18_OUT);
  EE := _TMP_AND35_OUT;
  _TMP_OR29_OUT := OR(_TMP_NOT16_OUT, _TMP_NOT18_OUT);
  _TMP_OR30_OUT := OR(X, _TMP_NOT16_OUT);
  _TMP_OR31_OUT := OR(W, X, _TMP_NOT18_OUT);
  _TMP_AND32_OUT := AND(_TMP_OR29_OUT, _TMP_OR30_OUT, _TMP_OR31_OUT);
  F := _TMP_AND32_OUT;
  _TMP_OR33_OUT := OR(W, X, Y);
  _TMP_AND34_OUT := AND(_TMP_OR24_OUT, _TMP_OR33_OUT);
  G := _TMP_AND34_OUT;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : SEVEN_SEGMENT_DISPLAY;
  END_RESOURCE
END_CONFIGURATION
