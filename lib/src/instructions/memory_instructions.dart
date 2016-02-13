part of llvm_dart.instructions;

abstract class MemoryInstruction implements Instruction {
}

class AllocaMemoryInstruction implements MemoryInstruction {
  AddressValue returnValue;
  IntConstantValue nbrElements;
  final Alignment align;
  
  AllocaMemoryInstruction(returnedVarName, type, [this.nbrElements, this.align]) {
    if (this.nbrElements == null)
      this.nbrElements = new IntConstantValue(1);
    this.returnValue = new LocalAddressValue(new PointerType(type), returnedVarName);
  }
  
  int get bytes {
    return this.returnValue.type.bytes * nbrElements.value;
  }
  
  String toString() {
    String str = "";
    
    str += this.returnValue.toString();
    str += " = alloca ";
    str += this.returnValue.type.toString();
    str += ", ";
    str += this.nbrElements.type.toString();
    str += " ";
    str += this.nbrElements.toString();
    
    if (this.align != null)
      str += ", ${this.align}";

    return str;
  }
}

class LoadMemoryInstruction implements MemoryInstruction {
  
}

class StoreMemoryInstruction implements MemoryInstruction {
  
}

class FenceMemoryInstruction implements MemoryInstruction {
  
}

class CmpxchgMemoryInstruction implements MemoryInstruction {
  
}

class AtomicrmwMemoryInstruction implements MemoryInstruction {
  
}

class GetelementptrMemoryInstruction implements MemoryInstruction {
  
}


