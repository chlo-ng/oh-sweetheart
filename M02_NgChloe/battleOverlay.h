
//{{BLOCK(battleOverlay)

//======================================================================
//
//	battleOverlay, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 13 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 416 + 2048 = 2976
//
//	Time-stamp: 2022-11-09, 15:48:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BATTLEOVERLAY_H
#define GRIT_BATTLEOVERLAY_H

#define battleOverlayTilesLen 416
extern const unsigned short battleOverlayTiles[208];

#define battleOverlayMapLen 2048
extern const unsigned short battleOverlayMap[1024];

#define battleOverlayPalLen 512
extern const unsigned short battleOverlayPal[256];

#endif // GRIT_BATTLEOVERLAY_H

//}}BLOCK(battleOverlay)
