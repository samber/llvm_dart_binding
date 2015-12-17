
#include <stdlib.h>
#include <stdio.h>

#include <llvm/Config/config.h>
#include <llvm-c/ExecutionEngine.h>

#include "llvm_dart.hh"


namespace LlvmDart {

  // int a
  // int b
  DART_EXT_FUNCTION(Fac) {
    DART_EXT_BEGIN();

    Dart_Handle args[2];
    DART_EXT_ARGS_2(args[0], args[1]);
    check_argument_int64(args[0]);
    check_argument_int64(args[1]);

    int64_t a, b;
    HandleError(Dart_IntegerToInt64(args[0], &a));
    HandleError(Dart_IntegerToInt64(args[1], &b));

    DART_EXT_END(Dart_NewInteger(a + b));
  }

  // no params
  DART_EXT_FUNCTION(LlvmVersion) {
    DART_EXT_BEGIN();

    DART_EXT_END(Dart_NewStringFromCString(PACKAGE_VERSION));
  }

  // no params
  DART_EXT_FUNCTION(LlvmLinkInMCJIT) {
    DART_EXT_BEGIN();

    LLVMLinkInMCJIT();
    DART_EXT_END(Dart_Null());
  }

}
