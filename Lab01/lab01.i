# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 23 "lab01.c"
void setPixel(int, int, unsigned short);
void drawLetter(int, int);
void drawRect(int, int);


volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);





    drawRect(30, 15);


    drawLetter(60, 40);
    drawLetter(80, 60);
    while(1);
}


void setPixel(int col, int row, unsigned short color) {


    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row) {



    for(int i=0; i<25; i++) {
        setPixel(col + i, row, ((31) | (0)<<5 | (0)<<10));
        setPixel(col + i, row + 16, ((31) | (0)<<5 | (0)<<10));
    }
    for(int i=0; i<17; i++) {
        setPixel(col, row + i, ((31) | (0)<<5 | (0)<<10));
        setPixel(col + 25, row + i, ((31) | (0)<<5 | (0)<<10));
    }

}

void drawLetter(int col, int row) {




    for(int i=0; i<15; i++) {
        setPixel(col, row + i, ((31) | (31)<<5 | (0)<<10));
    }
    for(int i=0; i<8; i++) {
        setPixel(col + 1 + i, (row + 7) + i, ((31) | (31)<<5 | (0)<<10));
        setPixel(col + 1 + i, (row + 7) - i, ((31) | (31)<<5 | (0)<<10));
    }

}
