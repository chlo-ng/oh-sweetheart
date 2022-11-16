// What is finished in the game so far:
// - The first room/level of the game

// What needs to be added:
// - Sprite where player is holding the weapon that is picking up
// - More varied levels. Maybe bigger.
// - Sound!
// - Collision Maps

// How to play the game:
// Arrow buttons to move up, down, left and right.
// Press switches to get a key and unlock the door!
// One switch disables the traps around the second switch.
// The second switch spawns the key.
// Pick up the knife and press A to damage the moving enemy (purple square)
// or else you will lose health gradually and lose.
// The key unlocks the door! Press A by the door to go to the win screen.

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

void initialize();

unsigned short buttons;
unsigned short oldButtons;

// game states
enum States {START, PAUSE, LEVELONE, LEVELTWO, INSTRUCTIONS, WIN, LOSE};
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

    goToStart();
}

void goToStart() {
    REG_DISPCTL |= SPRITE_ENABLE;
    initStartScreen();

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
        initLevelOne();
        goToLevelOne();
        // initLevelTwo();
        // goToLevelTwo();
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
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | BG_SIZE_WIDE;

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
        goToWin();
    }

    if (heroHealth <= 0) {
        goToLose();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        lastState = LEVELTWO;
        goToPause();
    }
}

void goToLose() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[7], loseMapLen / 2);

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
    }
}