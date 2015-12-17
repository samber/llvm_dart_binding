
LLVM_COMPONENTS="all-targets \
		 analysis \
		 asmparser \
		 asmprinter \
		 bitreader \
		 bitwriter \
		 codegen \
		 core \
		 debuginfo \
		 executionengine \
		 instrumentation \
	   	 interpreter \
		 ipo \
		 irreader \
		 linker \
		 mc \
		 mcjit \
		 objcarcopts \
		 option \
		 profiledata \
		 scalaropts \
		 support \
		 target"


CPPFLAGS += -fPIC -W -Wall -Werror -pedantic -ldl -std=c++11	\
	`llvm-config --libs --ldflags $(LLVM_COMPONENTS)`	\
	-lLLVM-`llvm-config --version`				\
	-isystem /usr/src/dart/dart/dart-sdk -DDART_SHARED_LIB	\
	-I ./include


all:	example build run

build:
	cd binding && g++ $(CPPFLAGS) -c *.cc
	cd binding && g++ $(CPPFLAGS) -shared -Wl,-soname,libllvm_dart.so -o libllvm_dart.so *.o

example:
	cd example && clang -S -emit-llvm fac.c

run:
	dart test.dart

