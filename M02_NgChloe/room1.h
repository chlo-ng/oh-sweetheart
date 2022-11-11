
//{{BLOCK(room1)

//======================================================================
//
//	room1, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2022-11-09, 18:10:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ROOM1_H
#define GRIT_ROOM1_H

#define room1TilesLen 64
extern const unsigned short room1Tiles[32];

#define room1MapLen 2048
extern const unsigned short room1Map[1024];

#define room1PalLen 512
extern const unsigned short room1Pal[256];

#endif // GRIT_ROOM1_H

//}}BLOCK(room1)
