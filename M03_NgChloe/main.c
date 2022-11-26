// What is finished in the game so far:
// - First level
// - Second level
// - Final boss level
// - Defeating final boss gives you the win!

// What needs to be added or changed:
// - Sprite where player is holding the weapon that is picking up
// - Inventory!
// - A better background
// - Implement collision maps
// - This is sort of a bug, but some sprites appear in random places when I go from room 1 to room 2
// - Currently, the final boss still doesn't do damage to the hero. Will need to add this feature.
// - More complicated enemies and puzzles
// - A third level, potentially a fourth if time permits.
// - Sprite tile modification!

// How to play the game:
// Arrow buttons to move up, down, left and right.
// Solve puzzles to get a key and unlock the door!

// First level - one switch disables the traps (deals dmg) and the other gives you the key
// The knife allows you to attack enemies and destroy watermelons to gain hearts

// Second level - press the switch in a certain order to receive a key, if wrong order pressed, hero gets damaged

// Final boss level - keep stabbing (press A) sweetheart until her HP is 0, a door will appear.
// Leave through this door to win!

#include "gba.h"
#include "print.h"
#include "startScreen.h"
#include "win.h"
#include "lose.h"
#include "pauseScreen.h"
#include "room1.h"
#include "room2.h"
#include "instructions.h"

#include "levelOne.h"
#include "levelTwo.h"
#include "bossLevel.h"

#include "sound.h"
#include "byyourside.h"
#include "whitespace.h"
#include "victoryroyale.h"

void initialize();

unsigned short buttons;
unsigned short oldButtons;

// game states
enum States {START, PAUSE, LEVELONE, LEVELTWO, BOSSLEVEL, INSTRUCTIONS, WIN, LOSE};
int state;

void start();
void goToStart();
void instructions();
void goToInstructions();
void pause();
void goToPause();
void win();
void goToWin();
void lose();
void goToLose();

// levels
void levelOne();
void goToLevelOne();
void levelTwo();
void goToLevelTwo();

void bossLevel();
void goToBossLevel();

// start screen variables
extern int howGame;
extern int playGame;

// game variables
extern int exitted;
extern int heroHealth;
extern int hOff;
extern int vOff;
int lastState;

int main() {
    // Call this to enable debugging.
	mgba_open();
	// Printing a warning to show logging is working.
	mgba_printf("Debugging Initialized");	

    initialize();

    while (1) {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch (state) {
            case START:
                start();
                break;
            
            case INSTRUCTIONS:
                instructions();
                break;
            
            case LEVELONE:
                levelOne();
                break;

            case LEVELTWO:
                levelTwo();
                break;

            case BOSSLEVEL:
                bossLevel();
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
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    buttons = BUTTONS;
    oldButtons = 0;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    setupInterrupts();
    setupSounds();
    
    goToStart();
}

void goToStart() {
    REG_DISPCTL |= SPRITE_ENABLE;
    initStartScreen();

    playSoundA(whitespace_data, whitespace_length, 1);

    state = START;
    lastState = 0;
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
        playSoundA(byyourside_data, byyourside_length, 1);
        initLevelOne();
        goToLevelOne();

        // initLevelTwo();
        // goToLevelTwo();

        // initBossLevel();
        // goToBossLevel();
        playGame = 0;
    }
}

void goToInstructions() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    DMANow(3, instructionsPal, PALETTE, 256);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[7], instructionsMapLen / 2);
    state = INSTRUCTIONS;
}

void instructions() {
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart();
    }
}

void goToLevelOne() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, room1Pal, PALETTE, 256);
    DMANow(3, room1Tiles, &CHARBLOCK[0], room1TilesLen / 2);
    DMANow(3, room1Map, &SCREENBLOCK[7], room1MapLen / 2);
    state = LEVELONE;
}

void levelOne() {
    updateLevelOne();
    waitForVBlank();
    drawLevelOne();

    if (exitted) {
        initLevelTwo();
        goToLevelTwo();
    }

    if (heroHealth <= 0) {
        goToLose();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        lastState = LEVELONE;
        goToPause();
    }
}

void goToLevelTwo() {
    waitForVBlank();

    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | BG_SIZE_LARGE;

    DMANow(3, room2Pal, PALETTE, 256);
    DMANow(3, room2Tiles, &CHARBLOCK[0], room2TilesLen / 2);
    DMANow(3, room2Map, &SCREENBLOCK[24], room2MapLen / 2);

    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;

    state = LEVELTWO;
}

void levelTwo() {
    updateLevelTwo();
    waitForVBlank();
    drawLevelTwo();

    if (exitted) {
        initBossLevel();
        goToBossLevel();
    }

    if (heroHealth <= 0) {
        goToLose();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        lastState = LEVELTWO;
        goToPause();
    }
}

void goToBossLevel() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, room1Pal, PALETTE, 256);
    DMANow(3, room1Tiles, &CHARBLOCK[0], room1TilesLen / 2);
    DMANow(3, room1Map, &SCREENBLOCK[7], room1MapLen / 2);

    state = BOSSLEVEL;
}

void bossLevel() {
    updateBossLevel();
    waitForVBlank();
    drawBossLevel();

    if (exitted) {
        goToWin();
    }
}

void goToLose() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[7], loseMapLen / 2);

    stopSounds();
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart();
    }
}

void goToWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, winPal, PALETTE, 256);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[7], winMapLen); 

    playSoundA(victoryroyale_data, victoryroyale_length, 1);

    state = WIN;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart();
    }
}

void goToPause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen / 2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[7], pauseScreenMapLen / 2); 

    pauseSounds();
    state = PAUSE;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_B)) {
        if (lastState == LEVELONE) {
            goToLevelOne();
        }

        if (lastState == LEVELTWO) {
            goToLevelTwo();
        }

        if (lastState == BOSSLEVEL) {
            goToBossLevel();
        }

        unpauseSounds();
    }
}