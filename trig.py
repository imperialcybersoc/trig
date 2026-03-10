from sage.all import *
from Crypto.Util.number import bytes_to_long

RR = RealField(6969)
f = RR(bytes_to_long(open("flag.txt", "rb").read().strip()))
ans = sin(RR(f)) + sin(2 * RR(f))
open("output.txt", "w+").write(str(ans))
