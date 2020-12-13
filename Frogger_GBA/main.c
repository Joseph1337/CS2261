#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "bg.h"
#include "gameBg.h"
#include "pausedbg.h"
#include "win.h"
#include "lose.h"
#include "game.h"
#include "spritesheet.h"
// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;
int seed;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];



int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA
void initialize() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    
    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// Sets up the start state
void goToStart() {
    DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen / 2 );
    DMANow(3, bgMap, &SCREENBLOCK[28], bgMapLen / 2);
    DMANow(3, bgPal, PALETTE, bgPalLen / 2);
    state = START;
}

// Runs every frame of the start state
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
     }
}

// Sets up the game state
void goToGame() {
    DMANow(3, gameBgTiles, &CHARBLOCK[0], gameBgTilesLen / 2 );
    DMANow(3, gameBgMap, &SCREENBLOCK[28], gameBgMapLen / 2);
    DMANow(3, gameBgPal, PALETTE, gameBgPalLen / 2);
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if(furthest < 15) {
        goToWin();
    }
    if(lives < 0) {
        goToLose();
    }
    
}

// Sets up the pause state
void goToPause() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, pausedbgTiles, &CHARBLOCK[0], pausedbgTilesLen / 2 );
    DMANow(3, pausedbgMap, &SCREENBLOCK[28], pausedbgMapLen / 2);
    DMANow(3, pausedbgPal, PALETTE, pausedbgPalLen / 2);
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } 
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    } 
}

// Sets up the win state
void goToWin() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2 );
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen / 2);
    DMANow(3, winPal, PALETTE, winPalLen / 2);
    state = WIN;
}

// Runs every frame of the win state
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2 );
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);
    DMANow(3, losePal, PALETTE, losePalLen / 2);
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}