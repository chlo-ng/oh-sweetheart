# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 19 "main.c"
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
# 20 "main.c" 2
# 1 "game.h" 1
int unlocked;
int pressed;
int exitted;
int equippedKey;
int equippedKnife;

void initGame();
void updateGame();
void drawGame();

enum { SPRITEFRONT, SPRITELEFT, SPRITERIGHT, SPRITEBACK, SPRITEIDLE};

void initializeSprites();
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
# 21 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 22 "main.c" 2
# 1 "startScreen.h" 1
# 22 "startScreen.h"
extern const unsigned short startScreenTiles[912];


extern const unsigned short startScreenMap[1024];


extern const unsigned short startScreenPal[256];

void initStartScreen();
void updateStartScreen();
void drawStartScreen();
# 23 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[672];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 24 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[672];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 25 "main.c" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[224];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 26 "main.c" 2
# 1 "room1.h" 1
# 22 "room1.h"
extern const unsigned short room1Tiles[32];


extern const unsigned short room1Map[1024];


extern const unsigned short room1Pal[256];
# 27 "main.c" 2

# 1 "startSprite.h" 1
# 21 "startSprite.h"
extern const unsigned short startSpriteTiles[16384];


extern const unsigned short startSpritePal[256];
# 29 "main.c" 2

void initialize();

unsigned short buttons;
unsigned short oldButtons;


enum States {START, PAUSE, GAME, INSTRUCTIONS, WIN, LOSE};
int state;

void start();
void goToStart();
void instructions();
void goToInstructions();
void game();
void goToGame();
void pause();
void goToPause();
void win();
void goToWin();
void lose();
void goToLose();


extern int howGame;
extern int playGame;


extern int exitted;
extern int heroHealth;

int main() {
    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state) {
            case START:
                start();
                break;

            case INSTRUCTIONS:
                instructions();
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

            default:
                break;
        }
    }
}

void initialize() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);

    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    goToStart();
}

void goToStart() {
    (*(volatile unsigned short *)0x4000000) |= (1<<12);
    initStartScreen();

    state = START;
}

void start() {
    updateStartScreen();
    waitForVBlank();
    drawStartScreen();

    if (howGame) {
        goToInstructions();
        howGame = 0;
    }

    if (playGame) {
        initGame();
        goToGame();
        playGame = 0;
    }
}

void goToInstructions() {
    state = INSTRUCTIONS;
}

void instructions() {
    if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))) {
        goToStart();
    }
}

void goToGame() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    DMANow(3, room1Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, room1Tiles, &((charblock *)0x6000000)[0], 64 / 2);
    DMANow(3, room1Map, &((screenblock *)0x6000000)[7], 2048 / 2);

    state = GAME;
}

void game() {
    updateGame();
    waitForVBlank();
    drawGame();

    if (exitted) {
        goToWin();
    }

    if (heroHealth <= 0) {
        goToLose();
    }

    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
}

void goToLose() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((7)<<8) | (0<<7) | (0<<14);

    DMANow(3, losePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 1344 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[7], 2048 / 2);

    state = LOSE;
}

void lose() {
    if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))) {
        goToStart();
    }
}

void goToWin() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((7)<<8) | (0<<7) | (0<<14);

    DMANow(3, winPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, winTiles, &((charblock *)0x6000000)[0], 1344 / 2);
    DMANow(3, winMap, &((screenblock *)0x6000000)[7], 2048);

    state = WIN;
}

void win() {
    if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))) {
        goToStart();
    }
}

void goToPause() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((7)<<8) | (0<<7) | (0<<14);

    DMANow(3, pauseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseScreenTiles, &((charblock *)0x6000000)[0], 448 / 2);
    DMANow(3, pauseScreenMap, &((screenblock *)0x6000000)[7], 2048 / 2);

    state = PAUSE;
}

void pause() {
    if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))) {
        goToGame();
    }
}
