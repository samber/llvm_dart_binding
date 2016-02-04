part of llvm_dart;

abstract class GrammarElement {
  String token = "";
  var childs = [];
  
  GrammarElement(this.token);
  
  String to_llvm_ir();
}
