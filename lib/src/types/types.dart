library llvm_dart.types;

part "simple_types.dart";
part "values.dart";
part "aggregates.dart";
part "function.dart";
part "alignment.dart";

abstract class Type {
  int bytes = 0;
}
