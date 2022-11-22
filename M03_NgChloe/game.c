#include "gba.h"
#include "game.h"
#include "print.h"

#include "sound.h"
#include "doorunlock.h"

OBJ_ATTR shadowOAM[128];

ANISPRITE hero;
int damaged;
int healed;
ANISPRITE enemy;

ANISPRITE door;
ANISPRITE key;
ANISPRITE knife;
ANISPRITE watermelon;
int smashed;

ANISPRITE healthBar;
HEALTH health[health_len];
ANISPRITE heart;
int used;

int count;

void updateHealth() {
    healthBar.worldCol = hero.worldCol;
    healthBar.worldRow = hero.worldRow - 8;

    for (int i = 0; i < health_len; i++) {
        if (damaged) {
            if (!health[i].erased) {
                health[i].erased = 1;
                heroHealth--;
                damaged = 0;
                mgba_printf("damaged %i", heroHealth);
                break;
            }
        }

        if (healed) {
            if (health[i].erased) {
                // redraw the correct healthbar
                if (!health[i + 1].erased) {
                    health[i].erased = 0;
                    heroHealth++;
                    healed = 0;
                    used = 1;
                    mgba_printf("healed %i", heroHealth);
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

    if(BUTTON_HELD(BUTTON_UP)) {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check
        // TODO 2.3: Add two collisionCheck calls per direction to check if hero is allowed to move there
        if (hero.worldRow >= 0) {
            hero.worldRow -= hero.rdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (vOff - 2 >= 0 && (hero.worldRow + hero.height/2 - vOff) <= (SCREENHEIGHT/2)) {
                // TODO 1.0: Update background offset (aka move the screen) if the above is true
                vOff-=2;
            }
        }
        hero.aniState = SPRITEBACK;

    }

    if(BUTTON_HELD(BUTTON_DOWN)) {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check (use MAPHEIGHT)
        // TODO 2.3: Add two collisionCheck calls per direction to check if hero is allowed to move there (use MAPHEIGHT)
        if (hero.worldRow + hero.height <= MAPHEIGHT) {
            hero.worldRow += hero.rdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (vOff + 2 < (MAPHEIGHT - SCREENHEIGHT) && (hero.worldRow + hero.height/2 - vOff) > (SCREENHEIGHT/2)) {
                // TODO 1.0: Update background offset if the above is true
                vOff+=2;
            }
        }
        
        hero.aniState = SPRITEFRONT;

    }

    if(BUTTON_HELD(BUTTON_LEFT)) {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check
        // TODO 2.3: Add two collisionCheck calls per direction to check if hero is allowed to move there
        if (hero.worldCol >= 0) {
            hero.worldCol -= hero.cdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (hOff - 2 >= 0 && (hero.worldCol + hero.width/2 - hOff) <= (SCREENWIDTH/2)) {
                // TODO 1.0: Update background offset if the above is true
                hOff-=2;
            }
        }
        
        hero.aniState = SPRITELEFT;

    }

    if(BUTTON_HELD(BUTTON_RIGHT)) {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check (use MAPWIDTH)
        // TODO 2.3: Add two collisionCheck calls per direction to check if hero is allowed to move there (use MAPWIDTH)
        if (hero.worldCol + hero.width <= MAPWIDTH) {
            hero.worldCol += hero.cdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (hOff + 2 < (MAPWIDTH - SCREENWIDTH) && (hero.worldCol + hero.width/2 - hOff) > (SCREENWIDTH/2)) {
                // TODO 1.0: Update background offset if the above is true
                hOff+=2;
            }
        }

        hero.aniState = SPRITERIGHT;
    }

    if (hero.aniState == SPRITEIDLE) {
        hero.curFrame = 0;
        hero.aniState = hero.prevAniState;
    } else {
        hero.aniCounter++;
    }

    

    // collect knife
    if (collision(hero.worldCol + 8, hero.worldRow, hero.width - 8, hero.height,
    knife.worldCol, knife.worldRow, knife.width, knife.height)) {
        equippedKnife = 1;
    }

    // unlock door
    if (equippedKey && collision(hero.worldCol, hero.worldRow, hero.width, hero.height, 
    door.worldCol, door.worldRow, door.width, door.height)) {
        if (BUTTON_PRESSED(BUTTON_A)) {
            playSoundB(doorunlock_data, doorunlock_length, 0);
            unlocked = 1;
        }
        
        if (unlocked && BUTTON_PRESSED(BUTTON_A)) {
            exitted = 1;
        }
    }

    // smash watermelon
    if (equippedKnife && collision(hero.worldCol, hero.worldRow, hero.width, hero.height,
    watermelon.worldCol, watermelon.worldRow, watermelon.width, watermelon.height)) {
        if (BUTTON_PRESSED(BUTTON_A)) {
            smashed = 1;
        }
    }

    // collect heart and heal
    if (smashed && heroHealth < 4 && collision(hero.worldCol + 8, hero.worldRow, hero.width - 8, hero.height,
    heart.worldCol, heart.worldRow, heart.width, heart.height)) {
        if (BUTTON_PRESSED(BUTTON_A)) {
            healed = 1;
        }
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
    shadowOAM[0].attr0 = ((hero.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = ((hero.worldCol - hOff) & COLMASK) | ATTR1_MEDIUM;
    if (!damaged) {
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(hero.curFrame * 4, hero.aniState * 4);

    } else {
        shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(hero.curFrame * 4, hero.aniState * 4);
    }

    // enemy
    if (enemyHealth > 0) {
        shadowOAM[1].attr0 = ((enemy.worldRow - vOff)& ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[1].attr1 = ((enemy.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 20);
    } else {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    }

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

    // healthBar
    shadowOAM[12].attr0 = ((healthBar.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[12].attr1 = ((healthBar.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
    shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 6);

    // health
    for (int i = 0; i < health_len; i++) {
        if (!health[i].erased) {
            shadowOAM[13 + i].attr0 = ((health[i].sprite.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13 + i].attr1 = ((health[i].sprite.worldCol - hOff) & COLMASK) | ATTR1_TINY;
            shadowOAM[13 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(27, 7);
        } else {
            shadowOAM[13 + i].attr0 |= ATTR0_HIDE;
        }
    }
    
    // knife
    if (!equippedKnife) {
        shadowOAM[18].attr0 = ((knife.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[18].attr1 = ((knife.worldCol - hOff) & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[18].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(25, 3);
    } else {
        shadowOAM[18].attr0 |= ATTR0_HIDE;
    }

    // watermelon 
    if (!smashed) {
        shadowOAM[42].attr0 = ((watermelon.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[42].attr1 = ((watermelon.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[42].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, 17);

    } else {
        shadowOAM[42].attr0 = ((watermelon.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[42].attr1 = ((watermelon.worldCol - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[42].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, 19);

        shadowOAM[17].attr0 = ((heart.worldRow - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[17].attr1 = ((heart.worldCol - hOff) & COLMASK) | ATTR1_TINY;
        shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(25, 6);
    }

    // collect heart
    if (used) {
        shadowOAM[17].attr0 |= ATTR0_HIDE;
    }
}
