part of llvm_dart.symbols;

class BasicBlock {
  final Label label;
  final List<Instruction> instructions;

  BasicBlock(this.instructions, [this.label]);

  String toString() {
    if (label != null && label.name is String)
      return "${label}:\n\t${instructions.join("\n\t")}";
    return "\t${instructions.join("\n\t")}";
  }
}

class Label {
  final name;

  Label(this.name);

  String toString() => name;
}

class Function {
  final FunctionType type;
  final String name;
  final List<Value> arguments;
  List<BasicBlock> basicBlocks;       // basicBlocks is not final because it can be set later (declared function != defined function)
  final Linkage linkage;
  final Visibility visibility;
  final DllStorage dllStorage;

  Function(this.type, this.name, this.arguments, [this.basicBlocks, this.linkage, this.visibility, this.dllStorage]);

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

    if (this.basicBlocks == null || this.basicBlocks.length == 0) {
      //
      // if declaration
      //
      res.write("declare ${headers}${this.type.returnType} @${this.name}(");

      // print arguments
      var it = this.arguments.iterator;
      it.moveNext();
      if (it.current != null)
        res.write("${it.current.type} ${it.current}");
      while (it.moveNext()) {
        res.write(", ");
        res.write("${it.current.type} ${it.current}");
      }

      res.write(")");
    } else {
      //
      // if definition
      //
      res.write("define ${headers}${this.type.returnType} @${this.name}(");

      // print arguments
      var it = this.arguments.iterator;
      it.moveNext();
      if (it.current != null)
        res.write("${it.current.type} ${it.current}");
      while (it.moveNext()) {
        res.write(", ");
        res.write("${it.current.type} ${it.current}");
      }

      res.write(") {\n");

      res.writeln(this.basicBlocks.join("\n"));

      res.writeln("}");
    }

    return res.toString();
  }
}
