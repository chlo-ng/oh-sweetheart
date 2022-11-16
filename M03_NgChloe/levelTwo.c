#include "gba.h"
#include "levelOne.h"
#include "levelTwo.h"
#include "spritesheet.h"
#include "print.h"

OBJ_ATTR shadowOAM[128];

ANISPRITE hero;
int damaged;
int healed;
ANISPRITE enemy;

ANISPRITE door;
TRAPS traps[traps_len];
SWITCHES switches[switches_len];
ANISPRITE key;
ANISPRITE knife;

ANISPRITE healthBar;
HEALTH health[health_len];
ANISPRITE heart;
int used;

int count;

void initLevelTwo() {
    initializeSprites2();
    count = 0;
    
    MAPWIDTH = 480;
    MAPHEIGHT = 160;
    vOff = 0;
    hOff = 0;
}

void updateLevelTwo() {
    updatePlayer();
    updateHealth();
    count++;
}

void drawLevelTwo() {
    drawSprites();

    DMANow(3, shadowOAM, OAM, 512);

    waitForVBlank();
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

void initializeSprites2() {
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], 8192*2);
    hideSprites();

    // player
    hero.width = 32;
    hero.height = 32;
    hero.worldRow = SCREENHEIGHT / 2 - hero.width / 2 + vOff;
    hero.worldCol = hOff;
    hero.cdel = 2;
    hero.rdel = 2;

    hero.aniCounter = 0;
    hero.curFrame = 0;
    hero.aniState = SPRITERIGHT;
    hero.numFrames = 3;
    exitted = 0;
    damaged = 0;
    healed = 0;

    // switches
    for (int i = 0; i < switches_len; i++) {
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

    // traps
    for (int i = 0; i < traps_len; i++) {
        traps[i].sprite.width = 8;
        traps[i].sprite.height = 8;
        traps[i].disabled = 1;
    }

    // door
    door.width = 32;
    door.height = 24;
    door.worldCol = 388;
    door.worldRow = 0;
    unlocked = 0;
}
