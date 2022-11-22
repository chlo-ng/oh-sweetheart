#include "gba.h"
#include "game.h"
#include "levelTwo.h"
#include "spritesheet.h"
#include "print.h"

#include "sound.h"
#include "switchpress.h"
#include "list.h"

OBJ_ATTR shadowOAM[128];

ANISPRITE hero;
int damaged;
int healed;
ANISPRITE enemy;

ANISPRITE door;
TRAPS traps[lvlTwoTraps];
SWITCHES switches[lvlTwoSwitches];
LIST* pressedOrder;
LIST* actualOrder;

ANISPRITE key;
int appear;
ANISPRITE knife;

ANISPRITE hint;

ANISPRITE healthBar;
HEALTH health[health_len];
ANISPRITE heart;
int used;

int count;

void initLevelTwo() {
    initializeSprites2();
    count = 0;
    
    MAPWIDTH = 512;
    MAPHEIGHT = 320;
    vOff = 0;
    hOff = 0;
}

void updateLevelTwo() {
    updatePlayer();
    updateHealth();
    updatePuzzle2();
    count++;
}

void drawLevelTwo() {
    drawSprites();
    mechanics2();

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
    hero.numFrames = 4;
    exitted = 0;
    damaged = 0;
    healed = 0;
    used = 0;
    equippedKey = 0;

    // switches
    for (int i = 0; i < lvlTwoSwitches; i++) {
        switches[i].sprite.width = 16;
        switches[i].sprite.height = 16;
        
        switches[i].sprite.worldCol = (40 * i) + 40;
        switches[i].sprite.worldRow = 216;
        
        switches[i].pressed = 0;
    }

    // init pressedOrder and actualOrder
    pressedOrder = create_list();
    actualOrder = create_list();
    push_back(actualOrder, 3);
    push_back(actualOrder, 1);
    push_back(actualOrder, 2);
    push_back(actualOrder, 4);

    // traps
    for (int i = 0; i < lvlTwoTraps; i++) {
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

    // hint
    hint.width = 16;
    hint.height = 16;
    hint.worldCol = 15;
    hint.worldRow = 250;

    // key
    key.width = 24;
    key.height = 24;
    key.worldCol = 95;
    key.worldRow = 250;
    appear = 0;

    // watermelon
    watermelon.width = 16;
    watermelon.height = 16;
    watermelon.worldCol = 480;
    watermelon.worldRow = 163;
    smashed = 0;

    // heart
    heart.width = 8;
    heart.height = 8;
    heart.worldCol = 484;
    heart.worldRow = 165;
    
}

void updatePuzzle2() {
    // correct order of buttons pressed
    for (int i = 0; i < lvlTwoSwitches; i++) {
        if (collision(hero.worldCol - 4, hero.worldRow + 16, hero.width - 16, hero.height - 20, 
        switches[i].sprite.worldCol, switches[i].sprite.worldRow, switches[i].sprite.width - 12, switches[i].sprite.height - 12)) {
            if (!switches[i].pressed) {
                playSoundB(switchpress_data, switchpress_length, 0);
                switches[i].pressed = 1;

                if (size(pressedOrder) != size(actualOrder)) {
                    switch (i) {
                        case 0:
                            push_back(pressedOrder, 1);
                            break;
                        case 1:
                            push_back(pressedOrder, 2);
                            break;
                        case 2:
                            push_back(pressedOrder, 3);
                            break;
                        case 3:
                            push_back(pressedOrder, 4);
                            break;
                    }

                }
                
            }
              
        }
    }

    // compare order of switches pressed
    if (size(pressedOrder) == size(actualOrder)) {
        if (compare(pressedOrder, actualOrder)) {
            // correct, key appears
            appear = 1;
            empty_list(pressedOrder);
        } else {
            // not correct, gets damaged
            damaged = 1;
            empty_list(pressedOrder);
            // reset switches
            for (int i = 0; i < lvlTwoSwitches; i++) {
                if (switches[i].pressed) {
                    switches[i].pressed = 0;
                }
            }
        }
    }

    // pick up key
    if (appear && collision(hero.worldCol, hero.worldRow, hero.width/2, hero.height/2, 
    key.worldCol, key.worldRow, key.width, key.height) && !equippedKey) {
        equippedKey = 1;
    }
    
}

void mechanics2() {

    for (int i = 0; i < lvlTwoSwitches; i++) {
        if (switches[i].pressed) {
            shadowOAM[38 + i].attr0 = ((switches[i].sprite.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[38 + i].attr1 = ((switches[i].sprite.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
            shadowOAM[38 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 17);

        } else {
            shadowOAM[38 + i].attr0 = ((switches[i].sprite.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[38 + i].attr1 = ((switches[i].sprite.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
            shadowOAM[38 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 19);
        }
    }

    // hint
        shadowOAM[43].attr0 = ((hint.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[43].attr1 = ((hint.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[43].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 24);

    // key will appear if the pressedOrder is correct!
    if (appear) {
        // key appears
        shadowOAM[5].attr0 = ((key.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[5].attr1 = ((key.worldCol - hOff) & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 27);
       
        if (equippedKey) {
            shadowOAM[5].attr0 |= ATTR0_HIDE;
        }
    }

    
}