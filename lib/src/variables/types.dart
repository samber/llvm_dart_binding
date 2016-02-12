part of llvm_dart.variables;

abstract class Type {
  int bytes = 0;
}

class IntType extends Type {
  final int bits;

  IntType(this.bits) {
    this.bytes = (bits / 8).ceil();
  }

  String toString() => "i${bits}";
}

class FloatType extends Type {
  int bits;

  FloatType(this.bits) {
    this.bytes = (bits / 8).ceil();
  }

  String toString() => "f${bits}";
}

class PointerType extends Type {
  final Type type;

  PointerType(this.type) {
    this.bytes = 8;
  }

  String toString() => "*";
}

class VectorType extends Type {
  final Type type;
  final int size;

  VectorType(this.type, this.size) {
    this.bytes = this.type.bytes * size;
  }

  String toString() => "<${size} x ${type}>";
}
