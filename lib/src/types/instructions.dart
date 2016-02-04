part of llvm_dart.types;

abstract class Instruction {
  
}

abstract class TerminatorInstruction implements Instruction {
  
}

abstract class BinaryInstruction implements Instruction {
  Value a, b;
  AddressValue returnValue;
  String operand;
  
  BinaryInstruction(this.operand, this.a, this.b, this.returnValue);
  
  String toString() => "${returnValue} = ${operand} ${returnValue.type} ${a}, ${b}";
}

abstract class MemoryInstruction implements Instruction {
  
}


abstract class AddBinaryInstruction extends BinaryInstruction {
  AddBinaryInstruction(operand, a, b, returnValue): super(operand, a, b, returnValue);
}

class IntAddBinaryInstruction extends AddBinaryInstruction {
  IntAddBinaryInstruction(a, b, returnValue): super("add", a, b, returnValue);
}

class FloatAddBinaryInstruction extends AddBinaryInstruction {
  FloatAddBinaryInstruction(a, b, returnValue): super("fadd", a, b, returnValue);
}


abstract class SubBinaryInstruction extends BinaryInstruction {
  SubBinaryInstruction(operand, a, b, returnValue): super(operand, a, b, returnValue);
}

class IntSubBinaryInstruction extends SubBinaryInstruction {
  IntSubBinaryInstruction(a, b, returnValue): super("sub", a, b, returnValue);
}

class FloatSubBinaryInstruction extends SubBinaryInstruction {
  FloatSubBinaryInstruction(a, b, returnValue): super("fsub", a, b, returnValue);
}


abstract class MulBinaryInstruction extends BinaryInstruction {
  MulBinaryInstruction(operand, a, b, returnValue): super(operand, a, b, returnValue);
}

class IntMulBinaryInstruction extends MulBinaryInstruction {
  IntMulBinaryInstruction(a, b, returnValue): super("mul", a, b, returnValue);
}

class FloatMulBinaryInstruction extends MulBinaryInstruction {
  FloatMulBinaryInstruction(a, b, returnValue): super("fmul", a, b, returnValue);
}



class RetTerminatorInstruction implements TerminatorInstruction {
  var value;
  
  RetTerminatorInstruction([this.value = null]);
  
  String toString() => value ? "ret void" : "ret ${value.type} ${value}";
}