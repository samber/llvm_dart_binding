part of llvm_dart.symbols;

abstract class Linkage {
  String linkage_token;

  Linkage(this.linkage_token);

  String toString() => linkage_token;
}

class PrivateLinkage implements Linkage {
  PrivateLinkage(): super("private");
}

class InternalLinkage implements Linkage {
  InternalLinkage(): super("interal");
}

class AvailableExternallyLinkage implements Linkage {
  AvailableExternallyLinkage(): super("available_externally");
}

class LinkonceLinkage implements Linkage {
  LinkonceLinkage(): super("linkonce");
}

class WeakLinkage implements Linkage {
  WeakLinkage(): super("weak");
}

class CommonLinkage implements Linkage {
  CommonLinkage(): super("common");
}

class AppendingLinkage implements Linkage {
  AppendingLinkage(): super("appending");
}

class ExternWeakLinkage implements Linkage {
  ExternWeakLinkage(): super("extern_weak");
}

class LinkonceOdrLinkage implements Linkage {
  LinkonceOdrLinkage(): super("linkonce_odr");
}

class WeakOdrLinkage implements Linkage {
  WeakOdrLinkage(): super("weak_odr");
}

class ExternalLinkage implements Linkage {
  ExternalLinkage(): super("external");
}
