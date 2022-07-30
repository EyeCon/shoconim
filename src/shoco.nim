{.compile:"shoco.c"}
proc shoco_compress*(inbuffer: cstring; len: csize_t; outbuffer: cstring;
                        bufsize: csize_t): csize_t {.importc: "shoco_compress", header: "shoco.h".}
proc shoco_decompress*(inbuffer: cstring; len: csize_t; outbuffer: cstring;
                        bufsize: csize_t): csize_t {.importc: "shoco_decompress", header: "shoco.h".}


proc compress*(s: string): string =
  let
    inBufSize = s.len.csize_t
    outBufSize = inBufSize
  var
    inBuf = newString(inBufSize)
    outBuf = newString(outBufSize)
  prepareMutation(inBuf)
  copyMem(inBuf[0].addr, s[0].addr, s.len)
  let outSize = shoco_compress(inBuf, inBufSize, outBuf, outBufSize)
  outBuf.setlen(outSize)
  return outBuf

proc decompress*(s: string): string =
  let
    inBufSize = s.len.csize_t
    outBufSize = inBufSize * 2
  var
    inBuf = newString(inBufSize)
    outBuf = newString(outBufSize)
  prepareMutation(inBuf)
  copyMem(inBuf[0].addr, s[0].addr, s.len)
  let outSize = shoco_decompress(inBuf, inBufSize, outBuf, outBufSize)
  outBuf.setlen(outSize)
  return outBuf
