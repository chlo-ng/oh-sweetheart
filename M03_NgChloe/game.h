int count;

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

ANISPRITE watermelon;
int smashed;

enum { SPRITEFRONT, SPRITELEFT, SPRITERIGHT, SPRITEBACK, SPRITEIDLE};

typedef struct {
    ANISPRITE sprite;
    int pressed;
} SWITCHES;

typedef struct  {
    ANISPRITE sprite;
    int disabled;
} TRAPS;


void updatePlayer();
void updateEnemy();
void updatePuzzle();

void drawSprites();

#define health_len 4
typedef struct {
    ANISPRITE sprite;
    int erased;

} HEALTH;

void updateHealth();

int heroHealth;
int enemyHealth;
// HEALTHBAR healthBars[health];
// int enemyHealth;

