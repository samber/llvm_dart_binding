part of llvm_dart.variables;

abstract class AggregateType extends Type {
}

class ArrayAggregateType extends AggregateType {
  final Type type;
  final int size;

  ArrayAggregateType(this.type, this.size) {
    this.bytes = this.type.bytes * this.size;
  }

  String toString() => "[${size} x ${type}]";
}

class StructureAggregateType extends AggregateType {
  final List<Type> types;
  final bool packed;

  StructureAggregateType(this.types, [this.packed = false]) {
    // @todo: manage the size for packed structures
    this.bytes = this.types
        .map((type) => type.bytes)
        .reduce((s1, s2) => s1 + s2);
  }

  String toString() {
    if (packed)
      return "<[${size} x ${type}]>";
    return "[${size} x ${type}]";
  }
}

