
library main;

import 'dart-ext:binding/llvm_dart';

int version() native "LlvmVersion";
void LlvmLinkInMCJIT() native "LlvmLinkInMCJIT";

void main() {
     LlvmLinkInMCJIT();
}
