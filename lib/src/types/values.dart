part of llvm_dart.types;

abstract class Value {
  var value;
  final Type type;

  Value(this.type);
}

abstract class AddressValue extends Value {
  final String scope;
  final String varName;

  AddressValue(type, this.scope, this.varName): super(type);

  String toString() => "${scope}${varName}";
}

class GlobalAddressValue extends AddressValue {
  GlobalAddressValue(type, varName): super(type, "@", varName);
}

class LocalAddressValue extends AddressValue {
  LocalAddressValue(type, varName): super(type, "%", varName);
}



class IntConstantValue extends Value {
  IntConstantValue(value): super(new IntType(64)) {
    this.value = value;
  }

  String toString() => value.toString();
}

class BoolConstantValue extends Value {
  BoolConstantValue(bool value): super(new IntType(1)) {
    this.value = value;
  }

  String toString() => value.toString();
}

class FloatConstantValue extends Value {
  FloatConstantValue(value): super(new FloatType(64)) {
    this.value = value;
  }

  String toString() => value.toString();
}

class NullConstantValue extends Value {
  NullConstantValue(): super(new PointerType(null)) {
    this.value = null;
  }

  String toString() => "null";
}
