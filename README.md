# shoconim
This is a [Nim language](https://nim-lang.org/) wrapper for the [shoco short text compressor](https://ed-von-schleck.github.io/shoco/).

# API
```nim
proc compress*(s: openArray[char]): string
proc decompress*(s: openArray[char]): string
```

# Preparation

You have to copy the 3 files from the [shoco project](https://github.com/Ed-von-Schleck/shoco):

* shoco.c
* shoco.h
* shoco_model.h

For the test to pass, you have to copy them into the `src` directory of this repo.

You also have to configure the directory you are using for these files as an include directory. You can do that by passing the switch `--passC:"-I directoryname"` to the Nim compiler. You can also put the following in a file with the same name but with a .nims extension: `switch("passC", "-I directoryname")` (see also tests directory in the repo).

For details on the configuration, see: https://nim-lang.org/docs/nims.html

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
