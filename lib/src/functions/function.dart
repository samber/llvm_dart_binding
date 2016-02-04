part of llvm_dart.functions;

class BasicBlock {
  Label label;
  List<Instruction> instructions;

  BasicBlock(this.instructions, [this.label]);

  String toString() {
    if (label != null && label.name is String)
      return "${label}:\n\t${instructions.join("\n\t")}";
    return "\t${instructions.join("\n\t")}";
  }
}

class Function {
  String functionName;
  Type resultType;
  List<Value> arguments;
  List<BasicBlock> basicBlocks;

  Function(this.functionName, this.resultType, this.arguments, this.basicBlocks);

  String toString() {
    var res = new StringBuffer();
    res.write("define ${resultType} @${functionName}(");

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

    return res.toString();
  }
}
