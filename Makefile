.EXPORT_ALL_VARIABLES:
# PYTHONLIBRARY = ~/opt/anaconda3/lib/libpython3.7m.dylib
# PYTHON_LOADER_LOGGING = 1

SRC = inference.swift
BIN = inference

# check toolchain
tool_chain:
	@lldb -P

# test all env vars exported
export:
	@echo $(PYTHONLIBRARY)

# test hello world
hello:
	swift hello.swift

# test simple TensorFlow
test:
	swift test.swift

# test simple inference
inference:
	swift inference.swift

# test Python interop
import:
	@echo $(PYTHONLIBRARY)
	swift import.swift

tf:
	swift tf.swift

register:
	python register.py --sys-prefix --swift-toolchain /Library/Developer/Toolchains/swift-latest

compile:
	swiftc -O -sdk `xcrun --show-sdk-path` $(SRC)

run-lsp:
	xcrun --toolchain swift sourcekit-lsp

run: compile
	./$(BIN)

clean:
	rm ./$(BIN)

all: run
