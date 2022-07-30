# shoconim
Nim language wrapper for the shoco short text compressor

# API
```nim
proc compress*(s: string): string
proc decompress*(s: string): string
```

# Preparation

You have to copy the 3 files from the shoco project:

* shoco.c
* shoco.h
* shoco_model.h

You also have to configure the directory you are using for these files as an include directory. You can do that by passing the switch `--passC:"-I directoryname"` to the Nim compiler. You can also put the following in a file with the same name but with a .nims extension: `switch("passC", "-I directoryname")` (see also tests directory in the repo)

# Usage

```nim
import std/[strutils]

import shoco

let
  testStr = "Quick brown fox jumps over the lazy dog"
  compressed = compress(testStr)
  decompressed = decompress(compressed)

assert decompressed == testStr

echo testStr.len
echo compressed.len
echo compressed.toHex
echo decompressed
```
