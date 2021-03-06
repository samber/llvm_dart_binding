part of llvm_dart.instructions;

abstract class TerminatorInstruction implements Instruction {

}

class RetTerminatorInstruction implements TerminatorInstruction {
  var value;

  RetTerminatorInstruction([this.value = null]);

  String toString() => value == null ? "ret void" : "ret ${value.type} ${value.toString()}";
}
