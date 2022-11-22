#include "gba.h"
#include "game.h"
#include "bossLevel.h"
#include "spritesheet.h"

OBJ_ATTR shadowOAM[128];

ANISPRITE hero;
int damaged;
int healed;

SWEETHEART sweetheart;
HEALTH swHealth[10];
ANISPRITE swHealthBar[4];
int sDamage;

ANISPRITE door;
ANISPRITE knife;

ANISPRITE watermelon;
int smashed;

ANISPRITE healthBar;
HEALTH health[health_len];
ANISPRITE heart;
int used;

int count;

void initBossLevel() {
    MAPWIDTH = 240;
    MAPHEIGHT = 160;
    vOff = 0;
    hOff = 0;
    initializeSprites3();
}

void updateBossLevel() {
    updatePlayer();
    updateHealth();
    updateMechanics();
    updateSH();
    updateSWHealth();
}

void drawBossLevel() {
    drawSprites();
    mechanics3();

    DMANow(3, shadowOAM, OAM, 512);

    waitForVBlank();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void initializeSprites3() {
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], 8192*2);
    hideSprites();

    // player
    hero.width = 32;
    hero.height = 32;
    hero.worldRow = SCREENHEIGHT - 30 + vOff;
    hero.worldCol = SCREENWIDTH / 2 - hero.width / 2 + hOff;
    hero.cdel = 2;
    hero.rdel = 2;

    hero.aniCounter = 0;
    hero.curFrame = 0;
    hero.aniState = SPRITEBACK;
    hero.numFrames = 4;
    exitted = 0;
    damaged = 0;
    healed = 0;
    used = 0;

    // sweetheart
    sweetheart.sprite.width = 32;
    sweetheart.sprite.height = 32;
    sweetheart.sprite.worldCol = (SCREENWIDTH - sweetheart.sprite.width) / 2;
    sweetheart.sprite.worldRow = (SCREENHEIGHT - sweetheart.sprite.height) / 2;
    sweetheart.sprite.cdel = 1;
    sweetheart.sprite.rdel = 1;

    sweetheart.sprite.aniCounter = 0;
    sweetheart.sprite.curFrame = 0;
    sweetheart.sprite.aniState = SPRITEFRONT;
    sweetheart.sprite.numFrames = 2;

    sweetheart.health = 10;
    sDamage = 0;
    initSWHealth();

    // door
    door.width = 32;
    door.height = 24;
    door.worldCol = SCREENWIDTH / 2 - 16;
    door.worldRow = 0;
    unlocked = 0;

    // watermelon
    watermelon.width = 16;
    watermelon.height = 16;
    watermelon.worldCol = 208;
    watermelon.worldRow = 32;
    smashed = 0;

    // heart
    heart.width = 8;
    heart.height = 8;
    heart.worldCol = watermelon.worldCol + 4;
    heart.worldRow = watermelon.worldRow + 2;
}

void initSWHealth() {
    for (int i = 0; i < 4; i++) {
        swHealthBar[i].worldCol = 88 + i*16;
        swHealthBar[i].worldRow = 3;
    }
    
    for (int i = 0; i < 10; i++) {
        swHealth[i].erased = 0;
    }
}

void updateSWHealth() {
    for (int i = 0; i < 10; i++) {
        if (sDamage) {
            if (!swHealth[i].erased) {
                swHealth[i].erased = 1;
                sweetheart.health--;
                sDamage = 0;
                break;
            }
        }

        swHealth[i].sprite.worldCol = 128 + (24 - i*8);
        swHealth[i].sprite.worldRow = 3;
    }
}

void updateSH() {
    if (sweetheart.sprite.aniState != SPRITEIDLE) {
        sweetheart.sprite.prevAniState = sweetheart.sprite.aniState;
        sweetheart.sprite.aniState = SPRITEIDLE;
    }

    // Change the animation frame every 15 frames of gameplay
    if(sweetheart.sprite.aniCounter % 12 == 0) {
        if (sweetheart.sprite.curFrame + 1 < sweetheart.sprite.numFrames) {
            sweetheart.sprite.curFrame++;
        } else {
            sweetheart.sprite.curFrame = 0;
        }
    }

    if(sweetheart.sprite.worldCol > hero.worldCol) {
        // Replace the 1 (always true) with the correct conditional check
        // collisionCheck calls per direction to check if hero is allowed to move there
        if (sweetheart.sprite.worldRow >= 0) {
            sweetheart.sprite.worldRow -= sweetheart.sprite.rdel;

            // Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (vOff - 2 >= 0 && (sweetheart.sprite.worldRow + sweetheart.sprite.height/2 - vOff) <= (SCREENHEIGHT/2)) {
                // Update background offset (aka move the screen) if the above is true
                vOff--;
            }
        }
        sweetheart.sprite.aniState = SPRITEBACK;

    }

    if(sweetheart.sprite.worldRow < hero.worldRow) {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check (use MAPHEIGHT)
        // TODO 2.3: Add two collisionCheck calls per direction to check if hero is allowed to move there (use MAPHEIGHT)
        if (sweetheart.sprite.worldRow + sweetheart.sprite.height <= MAPHEIGHT) {
            sweetheart.sprite.worldRow += sweetheart.sprite.rdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (vOff + 2 < (MAPHEIGHT - SCREENHEIGHT) && (sweetheart.sprite.worldRow + sweetheart.sprite.height/2 - vOff) > (SCREENHEIGHT/2)) {
                // TODO 1.0: Update background offset if the above is true
                vOff++;
            }
        }
        
        sweetheart.sprite.aniState = SPRITEFRONT;

    }

    if(sweetheart.sprite.worldCol > hero.worldCol) {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check
        // TODO 2.3: Add two collisionCheck calls per direction to check if hero is allowed to move there
        if (sweetheart.sprite.worldCol >= 0) {
            sweetheart.sprite.worldCol -= sweetheart.sprite.cdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (hOff - 2 >= 0 && (sweetheart.sprite.worldCol + sweetheart.sprite.width/2 - hOff) <= (SCREENWIDTH/2)) {
                // TODO 1.0: Update background offset if the above is true
                hOff--;
            }
        }
        
        sweetheart.sprite.aniState = SPRITELEFT;

    }

    if(sweetheart.sprite.worldCol < hero.worldCol) {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check (use MAPWIDTH)
        // TODO 2.3: Add two collisionCheck calls per direction to check if hero is allowed to move there (use MAPWIDTH)
        if (sweetheart.sprite.worldCol + sweetheart.sprite.width <= MAPWIDTH) {
            sweetheart.sprite.worldCol += sweetheart.sprite.cdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (hOff + 2 < (MAPWIDTH - SCREENWIDTH) && (sweetheart.sprite.worldCol + sweetheart.sprite.width/2 - hOff) > (SCREENWIDTH/2)) {
                // TODO 1.0: Update background offset if the above is true
                hOff++;
            }
        }

        sweetheart.sprite.aniState = SPRITERIGHT;
    }

    if (sweetheart.sprite.aniState == SPRITEIDLE) {
        sweetheart.sprite.curFrame = 0;
        sweetheart.sprite.aniState = sweetheart.sprite.prevAniState;
    } else {
        sweetheart.sprite.aniCounter++;
    }

    // taking damage from hero
    if (collision(hero.worldCol, hero.worldRow, hero.width, hero.height,
    sweetheart.sprite.worldCol, sweetheart.sprite.worldRow, sweetheart.sprite.width, sweetheart.sprite.height)) {
        if (equippedKnife && BUTTON_PRESSED(BUTTON_A)) {
            sDamage = 1;
        }
    }
}

void updateMechanics() {
}

void mechanics3() {
     // sweetheart
    if (sweetheart.health > 0) {
        shadowOAM[1].attr0 = ((sweetheart.sprite.worldRow - vOff)& ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[1].attr1 = ((sweetheart.sprite.worldCol - hOff) & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(sweetheart.sprite.curFrame * 4 + 16, sweetheart.sprite.aniState * 4 + 12);
    } else {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    }

    // healthBar
    shadowOAM[52].attr0 = ((3 - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[52].attr1 = ((80 - hOff) & COLMASK) | ATTR1_TINY;
    shadowOAM[52].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 6);

    shadowOAM[53].attr0 = ((3- vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[53].attr1 = ((152 - hOff) & COLMASK) | ATTR1_TINY;
    shadowOAM[53].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(30, 6);

    for (int i = 0; i < 4; i++) {
        shadowOAM[54 + i].attr0 = ((swHealthBar[i].worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[54 + i].attr1 = ((swHealthBar[i].worldCol - hOff) & COLMASK) | ATTR1_TINY;
        shadowOAM[54 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 6);
    }

    // health
    for (int i = 0; i < 10; i++) {
        if (!swHealth[i].erased) {
            shadowOAM[58 + i].attr0 = ((swHealth[i].sprite.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[58 + i].attr1 = ((swHealth[i].sprite.worldCol - hOff) & COLMASK) | ATTR1_TINY;
            shadowOAM[58 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 7);
        } else {
            shadowOAM[58 + i].attr0 |= ATTR0_HIDE;
        }
    }

    if (sweetheart.health <= 0) {
        // change this later
        equippedKey = 1;

        // door
        if (unlocked) {
            shadowOAM[2].attr0 = ((door.worldRow - vOff)& ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[2].attr1 = ((door.worldCol - hOff)  & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 22);
        } else {
            shadowOAM[2].attr0 = ((door.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[2].attr1 = ((door.worldCol - hOff)  & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 17);
        }
    } else {
        shadowOAM[2].attr0 |= ATTR0_HIDE;
    }

}

