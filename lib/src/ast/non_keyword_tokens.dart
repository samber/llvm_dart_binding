part of llvm_dart;

class NonZeroDecimalDigit extends GrammarElement {
  int value;
  
  NonZeroDecimalDigit(String token): super(token) {
    value = int.parse(token);
  }
  
  String to_llvm_ir() => value.toString();
}

class DecimalDigit extends GrammarElement {
  int value;

  DecimalDigit(String token): super(token) {
    value = int.parse(token);
  }
  
  String to_llvm_ir() => value.toString();
}