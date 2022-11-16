int unlocked;
int pressed;
int exitted;
int equippedKey;
int equippedKnife;

// screen variables
int hOff;
int vOff;
int MAPHEIGHT;
int MAPWIDTH;

void initLevelOne();
void updateLevelOne();
void drawLevelOne();

enum { SPRITEFRONT, SPRITELEFT, SPRITERIGHT, SPRITEBACK, SPRITEIDLE};

void initializeSprites1();
void initializeBg();

#define switches_len 2
typedef struct {
    ANISPRITE sprite;
    int pressed;
} SWITCHES;

void initializeSwitches();


#define traps_len 6
typedef struct  {
    ANISPRITE sprite;
    int disabled;
} TRAPS;

void initializeTraps();

void updatePlayer();
void updateEnemy();

void drawSprites();

#define health_len 4
typedef struct {
    ANISPRITE sprite;
    int erased;

} HEALTH;

void initializeHealth();
void updateHealth();

int heroHealth;
int enemyHealth;
// HEALTHBAR healthBars[health];
// int enemyHealth;