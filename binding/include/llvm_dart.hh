
#ifndef LLVM_DART_EXTENSION_HH_
#define LLVM_DART_EXTENSION_HH_

#include <stdlib.h>

#include "include/dart_api.h"
#include "include/dart_native_api.h"

#include "types.hh"


/************** DART EXTENSIONS HELPERS **************/
#define DART_EXT_ARG(name, i)			name = HandleError(Dart_GetNativeArgument(arguments, i));
#define DART_EXT_ARGS_1(arg0)			DART_EXT_ARG(arg0, 0)
#define DART_EXT_ARGS_2(arg0, arg1)		DART_EXT_ARGS_1(arg0); DART_EXT_ARG(arg1, 1)
#define DART_EXT_ARGS_3(arg0, arg1, arg2)	DART_EXT_ARGS_2(arg0, arg1); DART_EXT_ARG(arg2, 2)
#define DART_EXT_ARGS_4(arg0, arg1, arg2, arg3) DART_EXT_ARGS_3(arg0, arg1, arg2); DART_EXT_ARG(arg3, 3)

#define DART_EXT_FUNCTION(name)			void name(Dart_NativeArguments arguments)
#define DART_EXT_BEGIN()			Dart_EnterScope();
#define DART_EXT_END(expr) {					\
    Dart_SetReturnValue(arguments, HandleError(expr));		\
    Dart_ExitScope();						\
    return;							\
  }


/************** PROTOTYPES **************/
// extension_helpers.cc
Dart_NativeFunction	ResolveName(Dart_Handle, int, bool*);
Dart_Handle		HandleError(Dart_Handle);

// types.cc
void			LlvmDartException(const char*);
void			check_argument_int64(Dart_Handle);

// llvm_dart.cc
namespace LlvmDart {
  DART_EXT_FUNCTION(LlvmVersion);
  DART_EXT_FUNCTION(LlvmLinkInMCJIT);
}


/************** TYPES **************/
struct			FunctionLookup {
  const char*		name;
  const int		argc;
  Dart_NativeFunction	function;
};


/************** STATIC VARIABLES **************/
static FunctionLookup	__attribute__ ((unused))function_list[] = {
  {"LlvmVersion", 0, LlvmDart::LlvmVersion},
  {"LlvmLinkInMCJIT", 0, LlvmDart::LlvmLinkInMCJIT},
  {NULL, 0, NULL}
};


#endif /* LLVM_DART_EXTENSION_HH_ */
