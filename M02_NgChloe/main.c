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
#include "game.h"
#include "print.h"
#include "startScreen.h"
#include "win.h"
#include "lose.h"
#include "pauseScreen.h"
#include "room1.h"

void initialize();

unsigned short buttons;
unsigned short oldButtons;

// game states
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

// start screen variables
extern int howGame;
extern int playGame;

// game variables
extern int exitted;
extern int heroHealth;

int main() {
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
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart();
    }
}

void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    DMANow(3, room1Pal, PALETTE, 256);
    DMANow(3, room1Tiles, &CHARBLOCK[0], room1TilesLen / 2);
    DMANow(3, room1Map, &SCREENBLOCK[7], room1MapLen / 2);

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

    if (BUTTON_PRESSED(BUTTON_START)) {
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
        goToGame();
    }
}