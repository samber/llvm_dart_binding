part of llvm_dart;

class NonZeroDecimalDigit extends GrammarElement {
  int value;
  
  NonZeroDecimalDigit(String token): super(token, "NonZeroDecimalDigit") {
    value = int.parse(token);
  }
  
  String to_llvm_ir() => value.toString();
  
  void check_syntax() {
    if (value < 1 || value > 9)
      throw new GrammarException("value must be include in [1, 2, 3, 4, 5, 6, 7, 8, 9]");
  }
}

class DecimalDigit extends GrammarElement {
  int value;

  DecimalDigit(String token): super(token, "DecimalDigit") {
    value = int.parse(token);
  }
  
  String to_llvm_ir() => value.toString();
  
  void check_syntax() {
    if (value < 0 || value > 9)
      throw new GrammarException("value must be include in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]");
  }
}