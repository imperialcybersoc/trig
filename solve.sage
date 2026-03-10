from sage.all import *
from Crypto.Util.number import long_to_bytes

RR = RealField(6969)
ans = RR(open("output.txt").read())

R.<s> = PolynomialRing(RR)
poly = 4 * s ** 4 - 3 * s ** 2 - 2 * ans * s + ans ** 2
roots = poly.roots()
SCALE = 2 ** 2048

def recover(theta):
    M = Matrix([
        [int(2 * pi * SCALE), 0, 0],
        [-SCALE,              1, 0],
        [int(theta * SCALE),  0, 1]
    ])

    for row in M.LLL():
        maybe_flag = abs(row[1])
        maybe_maybe_flag = long_to_bytes(int(maybe_flag))

        if maybe_maybe_flag.startswith(b"imperial"):
            print(maybe_maybe_flag)

for root, _ in roots:
    if root.imag() == 0 and -1 <= root.real() <= 1:
        theta = asin(root.real())
        recover(theta)
        recover(pi - theta)
