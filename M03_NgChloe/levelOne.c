#include "gba.h"
#include "levelOne.h"
#include "game.h"
#include "spritesheet.h"
#include "print.h"

#include "sound.h"
#include "switchpress.h"

OBJ_ATTR shadowOAM[128];

ANISPRITE hero;
int damaged;
int healed;
ANISPRITE enemy;

ANISPRITE door;
TRAPS traps[lvlOneTraps];
SWITCHES switches[lvlOneSwitches];
ANISPRITE key;
ANISPRITE knife;

ANISPRITE healthBar;
HEALTH health[health_len];
ANISPRITE heart;
int used;

int count;

void initLevelOne() {
    initializeSprites1();

    MAPWIDTH = 240;
    MAPHEIGHT = 160;
    vOff = 0;
    hOff = 0;
    count = 0;
}

void updateLevelOne() {
    updateEnemy();
    updatePlayer();
    updateHealth();
    updatePuzzle1();
    count++;
}

void drawLevelOne() {
    drawSprites();
    mechanics1();

    DMANow(3, shadowOAM, OAM, 512);
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void initializeSprites1() {
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], 8192*2);
    hideSprites(); 
     // player
    hero.worldCol = SCREENWIDTH / 2 - 16;
    hero.worldRow = 128;

    hero.width = 32;
    hero.height = 32;
    hero.cdel = 1;
    hero.rdel = 1;
    hero.aniCounter = 0;
    hero.curFrame = 0;
    hero.aniState = SPRITEFRONT;
    hero.numFrames = 4;
    exitted = 0;
    damaged = 0;
    healed = 0;
    heroHealth = health_len;

    // enemy
    enemy.width = 16;
    enemy.height = 16;
    enemy.worldCol = 100;
    enemy.worldRow = 40;
    enemy.cdel = 1;
    enemy.rdel = 1;
    enemyHealth = 1;

    // trap
    initializeTraps();

    // door
    door.width = 32;
    door.height = 32;
    door.worldCol = SCREENWIDTH / 2 - 16;
    door.worldRow = 0;
    unlocked = 0;

    // switches
    initializeSwitches();

    // key
    key.width = 24;
    key.height = 24;
    key.worldCol = SCREENWIDTH / 2 - 16;
    key.worldRow = SCREENHEIGHT / 2 - 16;
    equippedKey = 0;

    initializeHealth();

    knife.width = 24;
    knife.height = 16;
    knife.worldCol = 60;
    knife.worldRow = 120;
    equippedKnife = 0;

    // watermelon
    watermelon.width = 16;
    watermelon.height = 16;
    watermelon.worldCol = 161;
    watermelon.worldRow = 118;
    smashed = 0;

    // heart
    heart.width = 8;
    heart.height = 8;
    heart.worldCol = 165;
    heart.worldRow = 120;
    used = 0;
}

void initializeSwitches() {
    for (int i = 0; i < lvlOneSwitches; i++) {
        switches[i].sprite.width = 16;
        switches[i].sprite.height = 16;;
        
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
    for (int i = 0; i < lvlOneTraps; i++) {
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

    for (int i = 0; i < health_len; i++) {
        health[i].erased = 0;
    }
    
}

void updatePuzzle1() {
    // update switch

    for (int i = 0; i < lvlOneSwitches; i++) {
        if (collision(hero.worldCol - 4, hero.worldRow + 16, hero.width - 16, hero.height - 20, 
        switches[i].sprite.worldCol, switches[i].sprite.worldRow, switches[i].sprite.width - 12, switches[i].sprite.height - 12)) {
            if (!switches[i].pressed) {
                playSoundB(switchpress_data, switchpress_length, 0);
            }   
            switches[i].pressed = 1;

        }
    }

    if (switches[0].pressed) {
        for (int i = 0; i < lvlOneTraps; i++) {
            traps[i].disabled = 1;
        }
    }

    if (switches[1].pressed && collision(hero.worldCol, hero.worldRow, hero.width, hero.height, 
    key.worldCol + 4, key.worldRow, key.width / 2, key.height / 2)) {
        equippedKey = 1;
    }
    // end update switch 

    if (enemyHealth > 0 && collision(hero.worldCol + 8, hero.worldRow, hero.width, hero.height,
    enemy.worldCol + 8, enemy.worldRow, enemy.width, enemy.height)) {
        if (count % 40 == 0) {
            damaged = 1;
        }

        if (equippedKnife && BUTTON_PRESSED(BUTTON_A)) {
            enemyHealth = 0;
        }
    }

    // collide with traps
    for (int i = 0; i < lvlOneTraps; i++) {
        if (!traps[i].disabled && collision(hero.worldCol + 8, hero.worldRow + 16, hero.width - 16, hero.height - 16,
        traps[i].sprite.worldCol, traps[i].sprite.worldRow, traps[i].sprite.width, traps[i].sprite.height)) {
            if (count % 40 == 0) {
                damaged = 1;
            }
        }
    }
}

void mechanics1() {
    // traps
    for (int i = 0; i < lvlOneTraps; i++) {
        if (!traps[i].disabled) {
            shadowOAM[6 + i].attr0 = ((traps[i].sprite.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[6 + i].attr1 = ((traps[i].sprite.worldCol - hOff)& COLMASK) | ATTR1_TINY;
            shadowOAM[6 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 17);
        } else {
            shadowOAM[6 + i].attr0 |= ATTR0_HIDE;
        }
    }

    // button to disable traps
    if (switches[0].pressed) {
        shadowOAM[3].attr0 = ((switches[0].sprite.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[3].attr1 = ((switches[0].sprite.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 17);

    } else {
        shadowOAM[3].attr0 = ((switches[0].sprite.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[3].attr1 = ((switches[0].sprite.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 19);
    }

    // button to unlock key
    if (switches[1].pressed) {
        shadowOAM[4].attr0 = ((switches[1].sprite.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = ((switches[1].sprite.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 17);
        
        // key appears
        shadowOAM[5].attr0 = ((key.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[5].attr1 = ((key.worldRow - hOff) & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 27);

    } else {
        shadowOAM[4].attr0 = ((switches[1].sprite.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = ((switches[1].sprite.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 19);
    }

    if (equippedKey) {
        shadowOAM[5].attr0 |= ATTR0_HIDE;
    }
}