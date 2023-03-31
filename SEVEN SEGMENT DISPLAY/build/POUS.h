#include "beremiz.h"
#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

__DECLARE_ENUMERATED_TYPE(LOGLEVEL,
  LOGLEVEL__CRITICAL,
  LOGLEVEL__WARNING,
  LOGLEVEL__INFO,
  LOGLEVEL__DEBUG
)
// FUNCTION_BLOCK LOGGER
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,MSG)
  __DECLARE_VAR(LOGLEVEL,LEVEL)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,TRIG0)

} LOGGER;

void LOGGER_init__(LOGGER *data__, BOOL retain);
// Code part
void LOGGER_body__(LOGGER *data__);
// FUNCTION_BLOCK PYTHON_EVAL
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(DWORD,STATE)
  __DECLARE_VAR(STRING,BUFFER)
  __DECLARE_VAR(STRING,PREBUFFER)
  __DECLARE_VAR(BOOL,TRIGM1)
  __DECLARE_VAR(BOOL,TRIGGED)

} PYTHON_EVAL;

void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain);
// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__);
// FUNCTION_BLOCK PYTHON_POLL
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(DWORD,STATE)
  __DECLARE_VAR(STRING,BUFFER)
  __DECLARE_VAR(STRING,PREBUFFER)
  __DECLARE_VAR(BOOL,TRIGM1)
  __DECLARE_VAR(BOOL,TRIGGED)

} PYTHON_POLL;

void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain);
// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__);
// FUNCTION_BLOCK PYTHON_GEAR
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(UINT,N)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  PYTHON_EVAL PY_EVAL;
  __DECLARE_VAR(UINT,COUNTER)
  __DECLARE_VAR(UINT,_TMP_ADD10_OUT)
  __DECLARE_VAR(BOOL,_TMP_EQ13_OUT)
  __DECLARE_VAR(UINT,_TMP_SEL15_OUT)
  __DECLARE_VAR(BOOL,_TMP_AND7_OUT)

} PYTHON_GEAR;

void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain);
// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__);
// PROGRAM SEVEN_SEGMENT_DISPLAY
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,W)
  __DECLARE_VAR(BOOL,X)
  __DECLARE_VAR(BOOL,Y)
  __DECLARE_VAR(BOOL,Z)
  __DECLARE_VAR(BOOL,A)
  __DECLARE_VAR(BOOL,B)
  __DECLARE_VAR(BOOL,C)
  __DECLARE_VAR(BOOL,DD)
  __DECLARE_VAR(BOOL,EE)
  __DECLARE_VAR(BOOL,F)
  __DECLARE_VAR(BOOL,G)

  // PROGRAM private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,_TMP_NOT18_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR14_OUT)
  __DECLARE_VAR(BOOL,_TMP_NOT17_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR19_OUT)
  __DECLARE_VAR(BOOL,_TMP_AND13_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR21_OUT)
  __DECLARE_VAR(BOOL,_TMP_NOT16_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR20_OUT)
  __DECLARE_VAR(BOOL,_TMP_AND22_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR23_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR24_OUT)
  __DECLARE_VAR(BOOL,_TMP_AND25_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR28_OUT)
  __DECLARE_VAR(BOOL,_TMP_AND35_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR29_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR30_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR31_OUT)
  __DECLARE_VAR(BOOL,_TMP_AND32_OUT)
  __DECLARE_VAR(BOOL,_TMP_OR33_OUT)
  __DECLARE_VAR(BOOL,_TMP_AND34_OUT)

} SEVEN_SEGMENT_DISPLAY;

void SEVEN_SEGMENT_DISPLAY_init__(SEVEN_SEGMENT_DISPLAY *data__, BOOL retain);
// Code part
void SEVEN_SEGMENT_DISPLAY_body__(SEVEN_SEGMENT_DISPLAY *data__);
#endif //__POUS_H
