#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"

OBJ_ATTR shadowOAM[128];

PLAYER player;
OBSTACLE obstacle[OBSTACLECOUNT];
TURTLE turtle[TURTLECOUNT];
LIFE livesObject[2];


int lives;
int countdown;
int time;
int furthest; //keeps track of furthest player has been for score
int speedCopy;
enum {UP, DOWN, RIGHT, LEFT, IDLE}; //animation states

void initGame() {
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();

    initPlayer();
    initLives();
    initObstacles();
    initTurtle();

    lives = 2;
    countdown = 30;
    furthest = (159 - 12);
    
    
}

void updateGame() {
    
    for (int i =0; i < OBSTACLECOUNT; i++) {
        updateObstacle(&obstacle[i]);
    }
    for(int i = 0; i < TURTLECOUNT; i++) {
        updateTurtle(&turtle[i]);
    }
    updateLives();
    updatePlayer();

    //converts time into seconds to display
    int skipframe = 60;
    if(time % skipframe == 0) {
        countdown -= 1;
    }
    time++;
}

void drawGame() {

    for (int i =0; i < OBSTACLECOUNT; i++) {
        drawObstacle(&obstacle[i]);
    }

    for(int i = 0; i < TURTLECOUNT; i++) {
        drawTurtle(&turtle[i]);
    }

    for(int i = 0; i < 2; i++) {
        drawLives(&livesObject[i]);
    }

    drawPlayer();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

}

//========================================PLAYER========================================//
void initPlayer() {
    player.row = 159 - 12;
	player.col = SCREENWIDTH/2 - player.width;
	player.height = 10;
	player.width = 12; 
    player.floating = 0;

    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 4; 
    player.aniState = UP;

}

void updatePlayer() {
    //set idle state
    if(player.aniState != IDLE) {
			player.prevAniState = player.aniState;
			player.aniState = IDLE;
		}
        if (player.curFrame < player.numFrames - 1) {
            player.curFrame++;
        } else {
            player.curFrame = 0;
        }

    if (BUTTON_PRESSED(BUTTON_LEFT) && player.col > 2) {
        player.aniState = LEFT; //frog faces left
        player.col -= player.width;
        
    } else if (BUTTON_PRESSED(BUTTON_RIGHT) && player.col + player.width - 1 < SCREENWIDTH - 1) {
        player.aniState = RIGHT; //frog faces right
        player.col += player.width;
        
    } else if (BUTTON_PRESSED(BUTTON_DOWN) && player.row + player.height < 150) {
        player.aniState = DOWN; //frog faces down
        player.row += player.width;
    } else if (BUTTON_PRESSED(BUTTON_UP) && player.row > 5) { //frog face up
        player.aniState = UP;
    
        player.row -= player.width;
        if(player.row < furthest) {
            furthest = player.row;
         
        }
        

    }
    if (player.aniState == IDLE) {
            player.curFrame = 0;
			player.aniState = player.prevAniState;
		}


    //checks if player is on a log or not
    if(isFloating()) {
         player.col += speedCopy;
    } else if(player.row < 75 && player.row > 10 && !isFloating()) {
         player.row = 159 - 12;
         player.col = SCREENWIDTH/2 - 12;
         lives--;
    }

}

void drawPlayer() {
    shadowOAM[0].attr0 = (player.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[0].attr1 = (player.col & COLMASK) | ATTR1_SMALL;
	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 2, player.curFrame * 2);
   
}

//=======================================OBSTACLES==================================//
void initObstacles() {
    for(int i=0; i<OBSTACLECOUNT; i++) {
        obstacle[i].col = getRandNumRange(0, 240);
        obstacle[i].row = (160 - 12 - 10) - i*12 - 3;
        obstacle[i].height = 12; 
        obstacle[i].width = 18; 
        obstacle[i].speed = getRandNumRange(-2, 2);
        if (i == 5) { //makes space for player before they jump on logs
            obstacle[i].active = 0;
        } else {
            obstacle[i].active = 1;
        }
        obstacle[i].curFrame = 7;
    }
}

void updateObstacle(OBSTACLE *o) {
    if (o -> active) {
        if (!(collision(player.col, player.row, player.width, player.height, o->col, o->row + 2, o->width, o->height - 2))) { //if there is no collision
            if (o -> speed < 0) { //if object is moving left
                if(o->col > -o->width) {
                    o->col += o->speed;
                } else { //reset object once it hits boundary
                    o->col = 239 - o->width;
                    o->speed = getRandNumRange(-2, -1);
                }
            } else if (o->speed > 0) { //if object is moving right
                if(o->col < 260 - o->width) {
                    o->col += o->speed;
                } else { //reset object once it hits boundary
                    o->col = 0;
                    o->speed = getRandNumRange(1,2);
                }
            } else { //get new speed if speed = 0
                o->speed = getRandNumRange(-2, 2);
            }
        } else { //if there is collision with player
            player.row = 159 - 12;
            player.aniState = UP;
            player.col = SCREENWIDTH/2 - player.width;
            lives--;
        }
    }
}

void drawObstacle(OBSTACLE *o) {
    if (o -> active) {
        for (int i=0; i<OBSTACLECOUNT; i++) {
                shadowOAM[1+i].attr0 = (obstacle[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[1+i].attr1 = (obstacle[i].col & COLMASK) | ATTR1_MEDIUM;
                if(obstacle[i].speed > 0) {
                    shadowOAM[1+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 14); //draw facing right
                } else {
                    shadowOAM[1+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 14); //draw facing left
                }
            }
     
    }
}


//================================Turtles==========================//
void initTurtle() {
    int j=0;
    for(int i = 0; i<TURTLECOUNT; i+=2) { //initialize 2 turtles per row
        turtle[i].row = (160 - 12 - 9 - 73) - j*12 - 2;
        turtle[i].height = 12;
        turtle[i].width = 16;
        turtle[i].active = 1;

        turtle[i].curFrame = 0;
        turtle[i].aniCounter = 0;
        turtle[i].numFrames = 3; 
        turtle[i].aniState = 10;

        turtle[i + 1].row = (160 - 12 - 9 - 73) - j*12 - 2;
        turtle[i + 1].height = 12;
        turtle[i + 1].width = 16;
        turtle[i + 1].active = 1;

        turtle[i + 1].curFrame = 0;
        turtle[i + 1].aniCounter = 0;
        turtle[i + 1].numFrames = 3; 
        turtle[i + 1].aniState = 10;

        if(j % 2 == 0) {
            turtle[i].col = getRandNumRange(0, 240); 
            turtle[i].speed = 1;
            turtle[i + 1].col = turtle[i].col - turtle[i].width; 
            turtle[i + 1].speed = 1;
        } else {
            turtle[i].col = getRandNumRange(0, 240);
            turtle[i].speed = -1;
            turtle[i + 1].col = turtle[i].col - turtle[i].width; 
            turtle[i + 1].speed = -1;
        }
        j++;
    }
}

void updateTurtle(TURTLE *l) {
    if (l -> active) {
        if (l->speed < 0) { //going left
            if(l->col > -l->width) {
                l->col += l->speed;
            } else { //reset object position
                l->col = 239 - l->width;
            }
        } else if (l->speed > 0) {     //going right    
            if(l->col < 240 + l->width) {
                l->col += l->speed;
            } else { //reset object position
                l->col = 0;
            }
        } else if (l->speed == 0) {
            l->speed = getRandNumRange(-1,1);
        }

        for (int i=0; i<TURTLECOUNT; i++) {
			turtle[i].aniCounter++;
			if(turtle[i].aniCounter % 100 == 0) {
				if(turtle[i].curFrame < turtle[i].numFrames - 1) {
					turtle[i].curFrame++;
				} else {
					turtle[i].curFrame = 0;
				}
			}
		}
    
    }
}


void drawTurtle(TURTLE *l) {
    if (l -> active) {
        for (int i=0; i<TURTLECOUNT; i++) {
                shadowOAM[1+OBSTACLECOUNT+i].attr0 = (turtle[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[1+OBSTACLECOUNT+i].attr1 = (turtle[i].col & COLMASK) | ATTR1_SMALL;
                if(turtle[i].speed < 0) {
                    shadowOAM[1+OBSTACLECOUNT+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(turtle[i].curFrame * 2, turtle[i].aniState); //turtle going left
                } else {
                     shadowOAM[1+OBSTACLECOUNT+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(turtle[i].curFrame * 2 + 6, turtle[i].aniState); //turtle going right
                }
               
            }
    }
}


//helper method for player-log collision
int isFloating() {
    for(int i = 0; i < TURTLECOUNT; i++) {
        if(player.row < 75) {
            if(collision(player.col, player.row, player.width, player.height, turtle[i].col, turtle[i].row, turtle[i].width, turtle[i].height)) {
                speedCopy = turtle[i].speed;
                return 1;
            }
        }
    }
    return 0;
}


//=====================================LIVES=====================================
void initLives() { //initialize lives remaining (player starts with 1 so there are only 2 lives left)
    livesObject[0].row = 144;
	livesObject[0].col = 0;
	livesObject[0].height = 8;
	livesObject[0].width = 8;
	livesObject[0].active = 1;
	livesObject[0].index = 1;

	livesObject[1].row = 144;
	livesObject[1].col = 12;
	livesObject[1].height = 8;
	livesObject[1].width = 8;
	livesObject[1].active = 1;
	livesObject[1].index = 2;

}

void updateLives() { //update the lives to be drawn
    if (lives == 1) {
		livesObject[1].active = 0;
	}
	if (lives == 0) {
		livesObject[0].active = 0;
	}
}

void drawLives(LIFE* x) { //draw lives
	if (x->active) {
                shadowOAM[1+OBSTACLECOUNT+TURTLECOUNT+x->index].attr0 = x->row | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[1+OBSTACLECOUNT+TURTLECOUNT+x->index].attr1 = x->col | ATTR1_SMALL;
                shadowOAM[1+OBSTACLECOUNT+TURTLECOUNT+x->index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 0);
        
    } else {
            shadowOAM[1+OBSTACLECOUNT+TURTLECOUNT+x->index].attr0 = ATTR0_HIDE;
        
    }
}