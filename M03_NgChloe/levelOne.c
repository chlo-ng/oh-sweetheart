#include "gba.h"
#include "levelOne.h"
#include "spritesheet.h"
#include "room1.h"

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

int hOff = 0;
int vOff = 0;

int count;

void initLevelOne() {
    initializeSprites();
    count = 0;
}

void updateLevelOne() {
    updateEnemy();
    updatePlayer();
    updateHealth();
    count++;
}

void drawLevelOne() {
    drawSprites();

    DMANow(3, shadowOAM, OAM, 512);
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void initializeSprites() {
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], 8192*2);
    hideSprites(); 

    // player
    hero.width = 32;
    hero.height = 32;
    hero.worldCol = SCREENWIDTH / 2 - 16;
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
    door.height = 24;
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
}

void initializeSwitches() {
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
}

void initializeTraps() {
    for (int i = 0; i < traps_len; i++) {
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

    heart.width = 8;
    heart.height = 8;
    heart.worldCol = 165;
    heart.worldRow = 120;
    used = 0;
}

void updateHealth() {
    healthBar.worldCol = hero.worldCol;
    healthBar.worldRow = hero.worldRow - 8;

    for (int i = 0; i < health_len; i++) {
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
                // redraw the correct healthbar
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

        // Change the animation frame every 15 frames of gameplay
        if(hero.aniCounter % 12 == 0) {
            if (hero.curFrame + 1 < hero.numFrames) {
                hero.curFrame++;
            } else {
                hero.curFrame = 0;
            }
        }

    if (BUTTON_HELD(BUTTON_LEFT)) {
        hero.aniState = SPRITELEFT;
        hero.worldCol -= hero.cdel;
    }

    if (BUTTON_HELD(BUTTON_RIGHT)) {
        hero.aniState = SPRITERIGHT;
        hero.worldCol += hero.cdel;
    }

    if (BUTTON_HELD(BUTTON_UP)) {
        hero.aniState = SPRITEBACK;
        hero.worldRow -= hero.rdel;
    }

    if (BUTTON_HELD(BUTTON_DOWN)) {
        hero.aniState = SPRITEFRONT;
        hero.worldRow += hero.rdel;
    }

    if (hero.aniState == SPRITEIDLE) {
        hero.curFrame = 0;
        hero.aniState = hero.prevAniState;
    } else {
        hero.aniCounter++;
    }
    
    // update switch
    for (int i = 0; i < switches_len; i++) {
        if (collision(hero.worldCol - 4, hero.worldRow + 16, hero.width - 16, hero.height - 20, 
        switches[i].sprite.worldCol, switches[i].sprite.worldRow, switches[i].sprite.width - 12, switches[i].sprite.height - 12)) {
            switches[i].pressed = 1;
        }
    }

    if (switches[0].pressed) {
        for (int i = 0; i < traps_len; i++) {
            traps[i].disabled = 1;
        }
    }

    if (switches[1].pressed && collision(hero.worldCol, hero.worldRow, hero.width, hero.height, 
    key.worldCol + 4, key.worldRow + 4, key.width / 2, key.height / 2)) {
        equippedKey = 1;
    }
    // end update switch

    if (equippedKey && collision(hero.worldCol, hero.worldRow, hero.width, hero.height, 
    door.worldCol, door.worldRow, door.width, door.height)) {
        unlocked = 1;

        if (BUTTON_PRESSED(BUTTON_A)) {
            exitted = 1;
        }
    }   

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
    for (int i = 0; i < traps_len; i++) {
        if (!traps[i].disabled && collision(hero.worldCol + 8, hero.worldRow + 16, hero.width - 16, hero.height - 16,
        traps[i].sprite.worldCol, traps[i].sprite.worldRow, traps[i].sprite.width, traps[i].sprite.height)) {
            if (count % 40 == 0) {
                damaged = 1;
            }
        }
    }

    // collect heart and heal
    if (heroHealth < 4 && collision(hero.worldCol + 8, hero.worldRow, hero.width - 8, hero.height,
    heart.worldCol, heart.worldRow, heart.width, heart.height)) {
        healed = 1;
    }

    // collect knife
    if (collision(hero.worldCol + 8, hero.worldRow, hero.width - 8, hero.height,
    knife.worldCol, knife.worldRow, knife.width, knife.height)) {
        equippedKnife = 1;
    }

}

void updateEnemy() {

    // boundaries
    if (enemy.worldCol + enemy.width >= 150) {
        enemy.cdel = -1;
    }

    if (enemy.worldCol <= 90) {
        enemy.cdel = 1;
    }

    // move towards hero
    if ((enemy.worldCol == hero.worldCol + 8) && ((hero.worldRow - 25) <= enemy.worldRow)) {
        enemy.cdel = 0;
        if (enemy.worldRow <= hero.worldRow - 4) {
            if (count % 2 == 0) {
                enemy.worldRow += enemy.rdel;
            } 
        }
    } else {
        // constantly move
        if (count % 2 == 0) {
            enemy.worldCol += enemy.cdel;
        }
    }

}

void drawSprites() {
    // player
    shadowOAM[0].attr0 = (hero.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (hero.worldCol & COLMASK) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(hero.curFrame * 4, hero.aniState * 4);

    // enemy
    if (enemyHealth > 0) {
        shadowOAM[1].attr0 = (enemy.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[1].attr1 = (enemy.worldCol & COLMASK) | ATTR1_SMALL;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 20);
    } else {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    }

    // door
    if (unlocked) {
        shadowOAM[2].attr0 = (door.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (door.worldCol & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 22);
    } else {
        shadowOAM[2].attr0 = (door.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (door.worldCol & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 17);
    }

    // button to disable traps
    if (switches[0].pressed) {
        shadowOAM[3].attr0 = (switches[0].sprite.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[3].attr1 = (switches[0].sprite.worldCol & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 17);

    } else {
        shadowOAM[3].attr0 = (switches[0].sprite.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[3].attr1 = (switches[0].sprite.worldCol & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 21);
    }

    // button to unlock key
    if (switches[1].pressed) {
        shadowOAM[4].attr0 = (switches[1].sprite.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = (switches[1].sprite.worldCol & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 17);

        shadowOAM[5].attr0 = (key.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[5].attr1 = (key.worldCol & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 27);

    } else {
        shadowOAM[4].attr0 = (switches[1].sprite.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = (switches[1].sprite.worldCol & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 21);
    }

    if (equippedKey) {
        shadowOAM[5].attr0 |= ATTR0_HIDE;
    }

    // traps
    for (int i = 0; i < traps_len; i++) {
        if (!traps[i].disabled) {
            shadowOAM[6 + i].attr0 = (traps[i].sprite.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[6 + i].attr1 = (traps[i].sprite.worldCol & COLMASK) | ATTR1_TINY;
            shadowOAM[6 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 17);
        } else {
            shadowOAM[6 + i].attr0 |= ATTR0_HIDE;
        }
    }

    // healthBar
    shadowOAM[12].attr0 = (healthBar.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[12].attr1 = (healthBar.worldCol & COLMASK) | ATTR1_SMALL;
    shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(15, 6);

    // health
    for (int i = 0; i < health_len; i++) {
        if (!health[i].erased) {
            shadowOAM[13 + i].attr0 = (health[i].sprite.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13 + i].attr1 = (health[i].sprite.worldCol & COLMASK) | ATTR1_TINY;
            shadowOAM[13 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(15, 7);
        } else {
            shadowOAM[13 + i].attr0 |= ATTR0_HIDE;
        }
    }

    // heart
    if (!healed) {
        shadowOAM[17].attr0 = (heart.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[17].attr1 = (heart.worldCol & COLMASK) | ATTR1_TINY;
        shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(13, 6);
    } else {
        shadowOAM[17].attr0 |= ATTR0_HIDE;
    }
    
    // knife
    if (!equippedKnife) {
        shadowOAM[18].attr0 = (knife.worldRow & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[18].attr1 = (knife.worldCol & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[18].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(13, 3);
    } else {
        shadowOAM[18].attr0 |= ATTR0_HIDE;
    }
}
