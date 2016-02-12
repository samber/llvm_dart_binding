part of llvm_dart.variables;

abstract class Linkage {
}

class PrivateLinkage implements Linkage {
}

class InternalLinkage implements Linkage {
}

class AvailableExternallyLinkage implements Linkage {
}

class LinkonceLinkage implements Linkage {
}

class WeakLinkage implements Linkage {
}

class ExternWeakLinkage implements Linkage {
}

class AppendingLinkage implements Linkage {
}

class CommonLinkage implements Linkage {
}

class LinkonceOdrLinkage implements Linkage {
}

class WeakOdrLinkage implements Linkage {
}

class ExternalLinkage implements Linkage {
}
