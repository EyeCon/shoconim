import std/[strutils, unittest]

import shoco

let
  testStr = "Quick brown fox jumps over the lazy dog"
  compressed = compress(testStr)
  decompressed = decompress(compressed)

check decompressed == testStr
check compressed.len <= testStr.len # shoco guarantees this
