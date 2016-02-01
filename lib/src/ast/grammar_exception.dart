part of llvm_dart;

class GrammarException implements Exception {
  String message = null;
  
  GrammarException(this.message);
  
  String toString() => "GrammarException";
}
 