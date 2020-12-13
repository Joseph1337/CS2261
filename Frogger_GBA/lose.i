# 1 "lose.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lose.c"
# 18 "lose.c"
const unsigned short loseTiles[240] __attribute__((aligned(4)))=
{
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x0001,0x0011,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x0011,0x0110,

 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x0100,0x1100,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x0001,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1000,0x0000,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x0100,0x1111,

 0x1011,0x1011,0x0111,0x1101,0x0111,0x1101,0x1111,0x1110,
 0x1111,0x1110,0x0111,0x1100,0x1111,0x1111,0x1111,0x1111,
 0x1101,0x1101,0x1101,0x1101,0x1101,0x1101,0x1101,0x1101,
 0x1101,0x1101,0x0011,0x1110,0x1111,0x1111,0x1111,0x1111,
 0x1110,0x1110,0x1110,0x1110,0x1110,0x1110,0x1110,0x1110,
 0x1110,0x1110,0x0001,0x1111,0x1111,0x1111,0x1111,0x1111,
 0x1011,0x1111,0x1011,0x1111,0x1011,0x1111,0x1011,0x1111,
 0x1011,0x1101,0x0001,0x1100,0x1111,0x1111,0x1111,0x1111,

 0x1110,0x0110,0x1110,0x0110,0x1110,0x1110,0x1110,0x1110,
 0x1110,0x0110,0x0001,0x0111,0x1111,0x1111,0x1111,0x1111,
 0x1011,0x1101,0x1111,0x0101,0x1100,0x0001,0x1011,0x0101,
 0x1011,0x1101,0x1100,0x0000,0x1111,0x1111,0x1111,0x1111,
 0x0101,0x1111,0x0111,0x1111,0x0111,0x1111,0x0111,0x1111,
 0x1101,0x1111,0x0100,0x1111,0x1111,0x1111,0x1111,0x1111,
};

const unsigned short loseMap[1024] __attribute__((aligned(4)))=
{
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0002,0x0003,0x0004,0x0005,0x0005,
 0x0006,0x0007,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0008,0x0009,0x000A,0x000B,0x000C,
 0x000D,0x000E,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
 0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

const unsigned short losePal[256] __attribute__((aligned(4)))=
{
 0x0000,0x001F,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
 0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};
