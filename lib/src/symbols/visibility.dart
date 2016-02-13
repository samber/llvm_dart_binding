part of llvm_dart.symbols;

abstract class Visibility {
  String visibility_token;

  Linkage(this.visibility_token);

  String toString() => visibility_token;
}

class DefaultVisibility implements Visibility {
  DefaultVisibility(): super("default");
}

class HiddenVisibility implements Visibility {
  HiddenVisibility(): super("hidden");
}

class ProtectedVisibility implements Visibility {
  ProtectedVisibility(): super("protected");
}
