
//{{BLOCK(room2)

//======================================================================
//
//	room2, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 20 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 640 + 8192 = 9344
//
//	Time-stamp: 2022-11-21, 13:57:25
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ROOM2_H
#define GRIT_ROOM2_H

#define room2TilesLen 640
extern const unsigned short room2Tiles[320];

#define room2MapLen 8192
extern const unsigned short room2Map[4096];

#define room2PalLen 512
extern const unsigned short room2Pal[256];

#endif // GRIT_ROOM2_H

//}}BLOCK(room2)
