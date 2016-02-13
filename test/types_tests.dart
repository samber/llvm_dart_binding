import "package:test/test.dart";
import "package:llvm_binder/llvm_dart.dart";
import 'package:llvm_binder/src/instructions/instructions.dart';
import 'package:llvm_binder/src/types/types.dart';

void main() {
  test("test Function + LocalAddressValue + IntType + Value + IntAddBinaryInstruction", () {
    List<Value> arguments = [];
    List<BasicBlock> basicBlocks = [];
    List<Instruction> instructions = [];

    arguments.add(new LocalAddressValue(new IntType(32), "a"));
    arguments.add(new LocalAddressValue(new IntType(32), "b"));

    var retValueAdd = new LocalAddressValue(new IntType(32), "retValueAdd");
    instructions.add(new IntAddBinaryInstruction(arguments[0], arguments[1], retValueAdd));
    instructions.add(new RetTerminatorInstruction(retValueAdd));

    basicBlocks.add(new BasicBlock(instructions));

    FunctionType functionType = new FunctionType(new IntType(32), [
      new IntType(32),
      new IntType(32)
    ]);

    var function = new Function(functionType, "addition", arguments, basicBlocks);

    expect(function.toString(), """define i32 @addition(i32 %a, i32 %b) {
	%retValueAdd = add i32 %a, %b
	ret i32 %retValueAdd
}
""");
  });
}
