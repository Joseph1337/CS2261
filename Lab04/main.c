#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
void goToStart(), goToGame(), goToPause(), goToWin(), goToLose();
void startState(), gameState(), pauseState(), winState(), loseState();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        // TODO 1.0: Make the state machine here
        switch(state) {
            case(START):
                startState();
                break;
            case(GAME):
                gameState();
                break;
            case(PAUSE):
                pauseState();
                break;
            case(WIN):
                winState();
                break;
            case(LOSE):
                loseState();
                break;
        }
    
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO 1.3: Call your goToStart function here
    goToStart();
}

// TODO 1.1: Make your state and state transition functions((
void goToStart() {
    fillScreen(MAGENTA);
    state = START;
}
void startState() {
    seed += 1;
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        srand(seed);
        initGame();
    }
}

void goToGame() {
    fillScreen(BLACK);
    state = GAME;
}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (ballsRemaining == 0) {
        goToWin();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
}

void goToPause() {
    fillScreen(BLUE);
    state = PAUSE;
}

void pauseState() { 
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(GREEN);
    state = WIN;
}

void winState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(RED);
    state = LOSE;
}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}