part of llvm_dart.instructions;

abstract class BitwiseBinaryInstruction implements Instruction {
  final Value a, b;
  final AddressValue returnValue;
  final String operand;

  BitwiseBinaryInstruction(this.operand, this.a, this.b, this.returnValue);

  String toString() => "${returnValue} = ${operand} ${returnValue.type} ${a}, ${b}";
}



/* SHL */
class ShlBitwiseBinaryInstruction extends BitwiseBinaryInstruction {
  ShlBitwiseBinaryInstruction(a, b, returnValue): super("shl", a, b, returnValue);
}

/* LSHR */
class LshrBitwiseBinaryInstruction extends BitwiseBinaryInstruction {
  LshrBitwiseBinaryInstruction(a, b, returnValue): super("lshr", a, b, returnValue);
}

/* ASHR */
class AshrBitwiseBinaryInstruction extends BitwiseBinaryInstruction {
  AshrBitwiseBinaryInstruction(a, b, returnValue): super("ashr", a, b, returnValue);
}



/* AND */
class AndBitwiseBinaryInstruction extends BitwiseBinaryInstruction {
  AndBitwiseBinaryInstruction(a, b, returnValue): super("and", a, b, returnValue);
}

/* OR */
class OrBitwiseBinaryInstruction extends BitwiseBinaryInstruction {
  OrBitwiseBinaryInstruction(a, b, returnValue): super("or", a, b, returnValue);
}

/* XOR */
class XorBitwiseBinaryInstruction extends BitwiseBinaryInstruction {
  XorBitwiseBinaryInstruction(a, b, returnValue): super("xor", a, b, returnValue);
}


