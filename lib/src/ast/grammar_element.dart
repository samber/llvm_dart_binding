part of llvm_dart;

abstract class GrammarElement {
  String token = "";
  String bnf_key = "";
  var childs = [];
  
  GrammarElement(this.token, this.bnf_key);
  
  String to_llvm_ir();
  
  void check_syntax();
}
