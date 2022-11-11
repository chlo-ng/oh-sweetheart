# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "game.c" 2
# 1 "room1.h" 1
# 22 "room1.h"
extern const unsigned short room1Tiles[32];


extern const unsigned short room1Map[1024];


extern const unsigned short room1Pal[256];
# 5 "game.c" 2

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

int hOff = 0;
int vOff = 0;

int count;

void initGame() {
    initializeSprites();
    count = 0;
}

void updateGame() {
    updateEnemy();
    updatePlayer();
    updateHealth();
    count++;
}

void drawGame() {
    drawSprites();

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}

void initializeSprites() {
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 8192*2);
    hideSprites();


    hero.width = 32;
    hero.height = 32;
    hero.worldCol = 240 / 2 - 16;
    hero.worldRow = 128;
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


    enemy.width = 16;
    enemy.height = 16;
    enemy.worldCol = 100;
    enemy.worldRow = 40;
    enemy.cdel = 1;
    enemy.rdel = 1;
    enemyHealth = 1;


    initializeTraps();


    door.width = 32;
    door.height = 24;
    door.worldCol = 240 / 2 - 16;
    door.worldRow = 0;
    unlocked = 0;


    initializeSwitches();


    key.width = 24;
    key.height = 24;
    key.worldCol = 240 / 2 - 16;
    key.worldRow = 160 / 2 - 16;
    equippedKey = 0;

    initializeHealth();

    knife.width = 24;
    knife.height = 16;
    knife.worldCol = 60;
    knife.worldRow = 120;
    equippedKnife = 0;
}

void initializeSwitches() {
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
}

void initializeTraps() {
    for (int i = 0; i < 6; i++) {
        traps[i].sprite.width = 8;
        traps[i].sprite.height = 8;
        traps[i].disabled = 0;
    }

    traps[0].sprite.worldCol = 47;
    traps[0].sprite.worldRow = 88;

    traps[1].sprite.worldCol = 47;
    traps[1].sprite.worldRow = 100;

    traps[2].sprite.worldCol = 26;
    traps[2].sprite.worldRow = 79;

    traps[3].sprite.worldCol = 26;
    traps[3].sprite.worldRow = 109;

    traps[4].sprite.worldCol = 38;
    traps[4].sprite.worldRow = 109;

    traps[5].sprite.worldCol = 38;
    traps[5].sprite.worldRow = 79;

}

void initializeHealth() {
    healthBar.worldCol = hero.worldCol;
    healthBar.worldRow = hero.worldRow - 4;

    for (int i = 0; i < 4; i++) {
        health[i].erased = 0;
    }

    heart.width = 8;
    heart.height = 8;
    heart.worldCol = 165;
    heart.worldRow = 120;
    used = 0;
}

void updateHealth() {
    healthBar.worldCol = hero.worldCol;
    healthBar.worldRow = hero.worldRow - 8;

    for (int i = 0; i < 4; i++) {
        if (damaged) {
            if (!health[i].erased) {
                health[i].erased = 1;
                heroHealth--;
                damaged = 0;
                break;
            }
        }

        if (healed && !used) {
            if (health[i].erased) {

                if (!health[i + 1].erased) {
                    health[i].erased = 0;
                    used = 1;
                    heroHealth++;
                    break;
                }
            }
        }

        health[i].sprite.worldCol = healthBar.worldCol + (24 - i*8);
        health[i].sprite.worldRow = healthBar.worldRow;
    }
}

void updatePlayer() {

    if (hero.aniState != SPRITEIDLE) {
            hero.prevAniState = hero.aniState;
            hero.aniState = SPRITEIDLE;
        }


        if(hero.aniCounter % 12 == 0) {
            if (hero.curFrame + 1 < hero.numFrames) {
                hero.curFrame++;
            } else {
                hero.curFrame = 0;
            }
        }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        hero.aniState = SPRITELEFT;
        hero.worldCol -= hero.cdel;
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        hero.aniState = SPRITERIGHT;
        hero.worldCol += hero.cdel;
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        hero.aniState = SPRITEBACK;
        hero.worldRow -= hero.rdel;
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        hero.aniState = SPRITEFRONT;
        hero.worldRow += hero.rdel;
    }

    if (hero.aniState == SPRITEIDLE) {
        hero.curFrame = 0;
        hero.aniState = hero.prevAniState;
    } else {
        hero.aniCounter++;
    }


    for (int i = 0; i < 2; i++) {
        if (collision(hero.worldCol - 4, hero.worldRow + 16, hero.width - 16, hero.height - 20,
        switches[i].sprite.worldCol, switches[i].sprite.worldRow, switches[i].sprite.width - 12, switches[i].sprite.height - 12)) {
            switches[i].pressed = 1;
        }
    }

    if (switches[0].pressed) {
        for (int i = 0; i < 6; i++) {
            traps[i].disabled = 1;
        }
    }

    if (switches[1].pressed && collision(hero.worldCol, hero.worldRow, hero.width, hero.height,
    key.worldCol + 4, key.worldRow + 4, key.width / 2, key.height / 2)) {
        equippedKey = 1;
    }


    if (equippedKey && collision(hero.worldCol, hero.worldRow, hero.width, hero.height,
    door.worldCol, door.worldRow, door.width, door.height)) {
        unlocked = 1;

        if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
            exitted = 1;
        }
    }

    if (enemyHealth > 0 && collision(hero.worldCol + 8, hero.worldRow, hero.width, hero.height,
    enemy.worldCol + 8, enemy.worldRow, enemy.width, enemy.height)) {
        if (count % 40 == 0) {
            damaged = 1;
        }

        if (equippedKnife && (!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
            enemyHealth = 0;
        }
    }


    for (int i = 0; i < 6; i++) {
        if (!traps[i].disabled && collision(hero.worldCol + 8, hero.worldRow + 16, hero.width - 16, hero.height - 16,
        traps[i].sprite.worldCol, traps[i].sprite.worldRow, traps[i].sprite.width, traps[i].sprite.height)) {
            if (count % 40 == 0) {
                damaged = 1;
            }
        }
    }


    if (heroHealth < 4 && collision(hero.worldCol + 8, hero.worldRow, hero.width - 8, hero.height,
    heart.worldCol, heart.worldRow, heart.width, heart.height)) {
        healed = 1;
    }


    if (collision(hero.worldCol + 8, hero.worldRow, hero.width - 8, hero.height,
    knife.worldCol, knife.worldRow, knife.width, knife.height)) {
        equippedKnife = 1;
    }

}

void updateEnemy() {


    if (enemy.worldCol + enemy.width >= 150) {
        enemy.cdel = -1;
    }

    if (enemy.worldCol <= 90) {
        enemy.cdel = 1;
    }


    if ((enemy.worldCol == hero.worldCol + 8) && ((hero.worldRow - 25) <= enemy.worldRow)) {
        enemy.cdel = 0;
        if (enemy.worldRow <= hero.worldRow - 4) {
            if (count % 2 == 0) {
                enemy.worldRow += enemy.rdel;
            }
        }
    } else {

        if (count % 2 == 0) {
            enemy.worldCol += enemy.cdel;
        }
    }

}

void drawSprites() {

    shadowOAM[0].attr0 = (hero.worldRow & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[0].attr1 = (hero.worldCol & 0x1FF) | (2 << 14);
    shadowOAM[0].attr2 = ((0)<<12) | ((hero.aniState * 4)*32+(hero.curFrame * 4));


    if (enemyHealth > 0) {
        shadowOAM[1].attr0 = (enemy.worldRow & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[1].attr1 = (enemy.worldCol & 0x1FF) | (1 << 14);
        shadowOAM[1].attr2 = ((0)<<12) | ((20)*32+(6));
    } else {
        shadowOAM[1].attr0 |= (2 << 8);
    }


    if (unlocked) {
        shadowOAM[2].attr0 = (door.worldRow & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[2].attr1 = (door.worldCol & 0x1FF) | (2 << 14);
        shadowOAM[2].attr2 = ((0)<<12) | ((22)*32+(0));
    } else {
        shadowOAM[2].attr0 = (door.worldRow & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[2].attr1 = (door.worldCol & 0x1FF) | (2 << 14);
        shadowOAM[2].attr2 = ((0)<<12) | ((17)*32+(0));
    }


    if (switches[0].pressed) {
        shadowOAM[3].attr0 = (switches[0].sprite.worldRow & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[3].attr1 = (switches[0].sprite.worldCol & 0x1FF) | (2 << 14);
        shadowOAM[3].attr2 = ((0)<<12) | ((17)*32+(10));

    } else {
        shadowOAM[3].attr0 = (switches[0].sprite.worldRow & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[3].attr1 = (switches[0].sprite.worldCol & 0x1FF) | (2 << 14);
        shadowOAM[3].attr2 = ((0)<<12) | ((21)*32+(10));
    }


    if (switches[1].pressed) {
        shadowOAM[4].attr0 = (switches[1].sprite.worldRow & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[4].attr1 = (switches[1].sprite.worldCol & 0x1FF) | (2 << 14);
        shadowOAM[4].attr2 = ((0)<<12) | ((17)*32+(10));

        shadowOAM[5].attr0 = (key.worldRow & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[5].attr1 = (key.worldCol & 0x1FF) | (2 << 14);
        shadowOAM[5].attr2 = ((0)<<12) | ((27)*32+(6));

    } else {
        shadowOAM[4].attr0 = (switches[1].sprite.worldRow & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[4].attr1 = (switches[1].sprite.worldCol & 0x1FF) | (2 << 14);
        shadowOAM[4].attr2 = ((0)<<12) | ((21)*32+(10));
    }

    if (equippedKey) {
        shadowOAM[5].attr0 |= (2 << 8);
    }


    for (int i = 0; i < 6; i++) {
        if (!traps[i].disabled) {
            shadowOAM[6 + i].attr0 = (traps[i].sprite.worldRow & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[6 + i].attr1 = (traps[i].sprite.worldCol & 0x1FF) | (0 << 14);
            shadowOAM[6 + i].attr2 = ((0)<<12) | ((17)*32+(6));
        } else {
            shadowOAM[6 + i].attr0 |= (2 << 8);
        }
    }


    shadowOAM[12].attr0 = (healthBar.worldRow & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[12].attr1 = (healthBar.worldCol & 0x1FF) | (1 << 14);
    shadowOAM[12].attr2 = ((0)<<12) | ((6)*32+(15));


    for (int i = 0; i < 4; i++) {
        if (!health[i].erased) {
            shadowOAM[13 + i].attr0 = (health[i].sprite.worldRow & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[13 + i].attr1 = (health[i].sprite.worldCol & 0x1FF) | (0 << 14);
            shadowOAM[13 + i].attr2 = ((0)<<12) | ((7)*32+(15));
        } else {
            shadowOAM[13 + i].attr0 |= (2 << 8);
        }
    }


    if (!healed) {
        shadowOAM[17].attr0 = (heart.worldRow & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[17].attr1 = (heart.worldCol & 0x1FF) | (0 << 14);
        shadowOAM[17].attr2 = ((0)<<12) | ((6)*32+(13));
    } else {
        shadowOAM[17].attr0 |= (2 << 8);
    }


    if (!equippedKnife) {
        shadowOAM[18].attr0 = (knife.worldRow & 0xFF) | (0 << 13) | (1 << 14);
        shadowOAM[18].attr1 = (knife.worldCol & 0x1FF) | (2 << 14);
        shadowOAM[18].attr2 = ((0)<<12) | ((3)*32+(13));
    } else {
        shadowOAM[18].attr0 |= (2 << 8);
    }
}
