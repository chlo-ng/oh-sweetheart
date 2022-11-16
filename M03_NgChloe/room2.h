
//{{BLOCK(room2)

//======================================================================
//
//	room2, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 352 + 4096 = 4960
//
//	Time-stamp: 2022-11-15, 23:10:04
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ROOM2_H
#define GRIT_ROOM2_H

#define room2TilesLen 352
extern const unsigned short room2Tiles[176];

#define room2MapLen 4096
extern const unsigned short room2Map[2048];

#define room2PalLen 512
extern const unsigned short room2Pal[256];

#endif // GRIT_ROOM2_H

//}}BLOCK(room2)
