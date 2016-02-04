part of llvm_dart.variables;

abstract class Type {

}

class IntType implements Type {
  final int bits;

  IntType(this.bits);

  String toString() => "i${bits}";
}

class FloatType implements Type {
  int bits;

  FloatType(this.bits);

  String toString() => "f${bits}";
}

class PointerType implements Type {
  final Type type;

  PointerType(this.type);

  String toString() => "*";
}

class VectorType implements Type {
  final Type type;
  final int size;

  VectorType(this.type, this.size);

  String toString() => "<${size} x ${type}>";
}
