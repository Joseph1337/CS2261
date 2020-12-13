typedef struct {
    int row; 
    int col;
    int height;
    int width;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    unsigned short* orientation;
    int floating;
} PLAYER;

typedef struct {
    int row;
    int col;
    int height;
    int width;
    int active;
    int speed;
    int curFrame;
} OBSTACLE;

typedef struct {
    int row;
    int col;
    int height;
    int width;
    int active;
    int speed;

    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} TURTLE;


typedef struct {
    int row;
	int col;
	int width;
    int height;
    int index;
    int active;
} LIFE;



extern int score;
extern int lives;
extern int countdown;
extern int furthest;  //tracks furthest distance for score and win state

#define OBSTACLECOUNT 5
#define TURTLECOUNT 10
//Prototypes
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initObstacles();
void updateObstacle(OBSTACLE *);
void drawObstacle(OBSTACLE *);

void initTurtle();
void updateTurtle(TURTLE *);
void drawTurtle(TURTLE *);

void initLives();
void updateLives();
void drawLives(LIFE *);

int isFloating();
