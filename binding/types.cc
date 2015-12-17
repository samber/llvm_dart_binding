
#include <string>

#include "types.hh"
#include "llvm_dart.hh"


namespace LlvmDart {

  LlvmDartException::LlvmDartException(const char *msg) {
    Dart_PropagateError(Dart_NewApiError(msg));
  }

}


void _bad_argument_type(std::string type) {
  std::string msg = "Bad argument type: " + type;
  LlvmDart::LlvmDartException(msg.c_str());
}

void check_argument_int64(Dart_Handle arg) {
  if (!Dart_IsInteger(arg))
    _bad_argument_type("int64_t");	// throw exception

  bool fits;
  HandleError(Dart_IntegerFitsIntoInt64(arg, &fits));
  if (!fits)
    _bad_argument_type("int64_t");	// throw exception
}
