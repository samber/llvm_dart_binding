part of llvm_dart.variables;

abstract class AggregateType {
}

class ArrayAggregateType implements AggregateType {
  final Type type;
  final int size;

  ArrayAggregateType(this.type, this.size);

  String toString() => "[${size} x ${type}]";
}

class StructureAggregateType implements AggregateType {
  final List<Type> types;
  final bool packed;

  StructureAggregateType(this.types, [this.packed = false]);

  String toString() {
    if (packed)
      return "<[${size} x ${type}]>";
    return "[${size} x ${type}]";
  }
}

