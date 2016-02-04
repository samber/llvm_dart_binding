part of llvm_dart.variables;

class FunctionType implements Type {
  final Type returnType;
  final List<Type> types;

  FunctionType(this.returnType, this.types);
}