part of llvm_dart.symbols;

class Global {
  final bool isConstant;        // the global can be "constant"
  final Type type;
  Value value;                  // can be updated (constant != global)
  final String varName;
  final Linkage linkage;
  final Visibility visibility;
  final DllStorage dllStorage;

  Global(this.isConstant, this.type, [this.value, this.varName, this.linkage, this.visibility, this.dllStorage]);

  void set value(Value val) {
    if (isConstant)
      throw new LlvmDartException("Global cannot be set to ${val}, because it is constant.");
    this.value = val;
  }

  String _toStringHeaders() {
    List<String> headers = [];

    if (this.linkage != null)
      headers.add(this.linkage);
    if (this.visibility != null)
      headers.add(this.visibility);
    if (this.dllStorage != null)
      headers.add(this.dllStorage);

    return headers.join(" ");
  }

  String toString() {
    var res = new StringBuffer();

    String headers = _toStringHeaders();
    if (headers.length == 0)
      headers += " ";

    if (this.varName != null)
      res.write("@${this.varName} = ");

    res.write(headers);

    if (this.isConstant)
      res.write("constant ");
    else
      res.write("global ");

    res.write("${this.type}");

    if (this.value)
      res.write(" ${this.value}");

    return res.toString();
  }
}
