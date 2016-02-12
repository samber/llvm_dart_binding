part of llvm_dart.functions;

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

class Function {
  final FunctionType type;
  final String name;
  final List<Value> arguments;
  List<BasicBlock> basicBlocks;       // basicBlocks is not final because it can be set later (declared function != defined function)
  final Linkage linkage;
  final Visibility visibility;
  final DllStorage dllStorage;

  Function(this.type, this.name, this.arguments, [this.basicBlocks, this.linkage, this.visibility, this.dllStorage]);

  String toString() {
    var res = new StringBuffer();

    if (this.basicBlocks == null || this.basicBlocks.length == 0) {
      //
      // if declaration
      //
      res.write("declare ${type.returnType} @${name}(");

      // print arguments
      var it = arguments.iterator;
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
      res.write("define ${type.returnType} @${name}(");

      // print arguments
      var it = arguments.iterator;
      it.moveNext();
      if (it.current != null)
        res.write("${it.current.type} ${it.current}");
      while (it.moveNext()) {
        res.write(", ");
        res.write("${it.current.type} ${it.current}");
      }

      res.write(") {\n");

      res.writeln(basicBlocks.join("\n"));

      res.writeln("}");
    }

    return res.toString();
  }
}
