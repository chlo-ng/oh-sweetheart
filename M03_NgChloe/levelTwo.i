# 1 "levelTwo.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "levelTwo.c"
# 1 "gba.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;





int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 40 "gba.h"
extern volatile unsigned short *videoBuffer;
# 65 "gba.h"
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);
void waitForVBlank();





void flipPage();
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 117 "gba.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;
# 146 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 157 "gba.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 197 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 254 "gba.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 310 "gba.h"
typedef void (*ihp)(void);
# 2 "levelTwo.c" 2
# 1 "levelOne.h" 1
int unlocked;
int pressed;
int exitted;
int equippedKey;
int equippedKnife;


int hOff;
int vOff;
int MAPHEIGHT;
int MAPWIDTH;

void initLevelOne();
void updateLevelOne();
void drawLevelOne();

enum { SPRITEFRONT, SPRITELEFT, SPRITERIGHT, SPRITEBACK, SPRITEIDLE};

void initializeSprites1();
void initializeBg();


typedef struct {
    ANISPRITE sprite;
    int pressed;
} SWITCHES;

void initializeSwitches();



typedef struct {
    ANISPRITE sprite;
    int disabled;
} TRAPS;

void initializeTraps();

void updatePlayer();
void updateEnemy();

void drawSprites();


typedef struct {
    ANISPRITE sprite;
    int erased;

} HEALTH;

void initializeHealth();
void updateHealth();

int heroHealth;
int enemyHealth;
# 3 "levelTwo.c" 2
# 1 "levelTwo.h" 1
void initLevelTwo();
void updateLevelTwo();
void drawLevelTwo();

void initializeSprites2();
void drawSprites();
# 4 "levelTwo.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "levelTwo.c" 2

OBJ_ATTR shadowOAM[128];

ANISPRITE hero;
int damaged;
int healed;
ANISPRITE enemy;

ANISPRITE door;
TRAPS traps[6];
SWITCHES switches[2];
ANISPRITE key;
ANISPRITE knife;

ANISPRITE healthBar;
HEALTH health[4];
ANISPRITE heart;
int used;

int count;

void initLevelTwo() {
    initializeSprites2();
    count = 0;

    MAPWIDTH = 480;
    vOff = 0;
    hOff = 0;
}

void updateLevelTwo() {
    updatePlayer();
    count++;
}

void drawLevelTwo() {
    drawSprites();

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    waitForVBlank();
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}

void initializeSprites2() {
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 8192*2);


    hero.width = 32;
    hero.height = 32;
    hero.worldCol = 5 + hOff;
    hero.worldRow = 160 / 2 - 48 + vOff;
    hero.cdel = 1;
    hero.rdel = 1;

    hero.aniCounter = 0;
    hero.curFrame = 0;
    hero.aniState = SPRITEFRONT;
    hero.numFrames = 3;
    exitted = 0;
    damaged = 0;
    healed = 0;
    heroHealth = 4;


    for (int i = 0; i < 2; i++) {
        switches[i].sprite.width = 24;
        switches[i].sprite.height = 24;

        if (i == 0) {
            switches[i].sprite.worldCol = 188;
            switches[i].sprite.worldRow = 88;
        } else {
            switches[i].sprite.worldCol = 20;
            switches[i].sprite.worldRow = 88;
        }

        switches[i].pressed = 0;
    }


    for (int i = 0; i < 6; i++) {
        traps[i].sprite.width = 8;
        traps[i].sprite.height = 8;
        traps[i].disabled = 1;
    }


    door.width = 32;
    door.height = 24;
    door.worldCol = 391;
    door.worldRow = 0;
    unlocked = 0;

}
