part of llvm_dart.utils;

class LlvmDartException implements Exception {
  String message;

  LlvmDartException(this.message);

  String toString() => this.message;
}
