
//{{BLOCK(win)

//======================================================================
//
//	win, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 42 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1344 + 2048 = 3904
//
//	Time-stamp: 2022-11-07, 12:18:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

const unsigned short winTiles[672] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5555,0x0000,
	0x5555,0x0005,0x5550,0x0005,0x5500,0x0055,0x5500,0x0555,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5500,
	0x0000,0x5550,0x0000,0x5550,0x0000,0x5555,0x5000,0x5555,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0055,0x0000,
	0x0055,0x0000,0x0005,0x5000,0x0000,0x5500,0x0000,0x5550,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5500,0x5555,
	0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x0555,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0055,0x0000,
	0x5555,0x0000,0x5555,0x0005,0x5555,0x0055,0x5550,0x0555,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5000,0x0555,
	0x5000,0x0555,0x5000,0x0555,0x5000,0x0555,0x5000,0x0555,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5555,0x0000,
	0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5500,
	0x0000,0x5500,0x0000,0x5000,0x0000,0x5000,0x0000,0x5000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0055,0x0000,
	0x0055,0x0000,0x0555,0x0000,0x0555,0x0000,0x0555,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5550,0x0055,
	0x5550,0x0055,0x5550,0x0055,0x5555,0x0555,0x0555,0x0555,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5550,
	0x0000,0x5550,0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5005,0x0555,
	0x5005,0x0555,0x5000,0x0555,0x5000,0x0555,0x5000,0x0555,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x5000,0x5555,
	0x5000,0x5555,0x5000,0x5555,0x5000,0x5555,0x5000,0x5555,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0005,0x0000,0x0005,0x0000,0x0055,0x0000,0x0055,0x0000,
	0x5000,0x0555,0x0000,0x5555,0x0000,0x5555,0x0000,0x5550,
	0x0000,0x5550,0x0000,0x5500,0x0000,0x5000,0x0000,0x5000,

	0x5000,0x0555,0x5500,0x0555,0x5500,0x0055,0x5555,0x0005,
	0x5555,0x0005,0x5555,0x0000,0x0555,0x0000,0x0555,0x0000,
	0x0000,0x5550,0x0000,0x5550,0x0000,0x5555,0x0000,0x5555,
	0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,
	0x0055,0x0000,0x0005,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x5500,0x0555,0x5000,0x0555,0x0000,0x5555,0x0000,0x5555,
	0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,

	0x5000,0x0555,0x5000,0x0555,0x5000,0x0555,0x5000,0x0555,
	0x5000,0x0555,0x5000,0x0555,0x5000,0x0555,0x5000,0x0555,
	0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,
	0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,
	0x0000,0x5000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0555,0x0000,0x0555,0x0000,0x5555,0x0000,0x5555,0x5000,
	0x5555,0x5000,0x5550,0x5000,0x5550,0x5000,0x5550,0x5505,

	0x0555,0x0555,0x0555,0x0555,0x0555,0x0555,0x0555,0x5555,
	0x0055,0x5550,0x0055,0x5550,0x0055,0x5550,0x0055,0x5550,
	0x0000,0x5555,0x0000,0x0555,0x5000,0x0555,0x5000,0x0555,
	0x5000,0x0555,0x5000,0x0055,0x5000,0x0055,0x5505,0x0055,
	0x5000,0x5555,0x5000,0x5555,0x5000,0x0555,0x5000,0x0555,
	0x5000,0x0555,0x5000,0x0555,0x5000,0x0555,0x5000,0x0555,
	0x0555,0x0000,0x0555,0x0000,0x5555,0x0000,0x5550,0x0000,
	0x5550,0x0005,0x5500,0x0005,0x5500,0x0055,0x5000,0x0055,

	0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,
	0x5555,0x0000,0x0550,0x0000,0x0550,0x0000,0x0550,0x0000,
	0x0000,0x5000,0x0000,0x5000,0x0000,0x5000,0x0000,0x5000,
	0x0000,0x5000,0x0000,0x5000,0x0000,0x5000,0x0000,0x5000,
	0x0555,0x0000,0x0555,0x0000,0x0555,0x0000,0x0555,0x0000,
	0x0555,0x0000,0x0555,0x0000,0x0555,0x0000,0x0555,0x0000,
	0x0000,0x5555,0x0000,0x5550,0x0000,0x5550,0x0000,0x5550,
	0x0000,0x5500,0x0000,0x5000,0x0000,0x0000,0x0000,0x0000,

	0x0005,0x0000,0x0005,0x0000,0x0055,0x0000,0x0555,0x0000,
	0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5500,0x5555,
	0x5000,0x5555,0x5000,0x0555,0x5500,0x0555,0x5550,0x0555,
	0x5555,0x0055,0x5555,0x0005,0x5555,0x0000,0x0005,0x0000,
	0x5000,0x0555,0x5000,0x0555,0x5000,0x5555,0x5000,0x5555,
	0x0000,0x5555,0x0000,0x5550,0x0000,0x5500,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x5000,0x0005,0x5500,
	0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,

	0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,
	0x0555,0x0000,0x0555,0x0000,0x0055,0x0000,0x0000,0x0000,
	0x5550,0x5505,0x5500,0x5505,0x5500,0x5505,0x5500,0x5555,
	0x5500,0x5555,0x5000,0x5555,0x5000,0x5555,0x5000,0x5555,
	0x0005,0x5500,0x0005,0x5500,0x0005,0x5500,0x0005,0x5500,
	0x0000,0x5000,0x0000,0x5000,0x0000,0x5000,0x0000,0x5000,
	0x5505,0x0055,0x5505,0x0005,0x5505,0x0005,0x5505,0x0005,
	0x5555,0x0005,0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,

	0x5000,0x0555,0x0000,0x0555,0x0000,0x5555,0x0000,0x5550,
	0x0000,0x5550,0x0000,0x5500,0x0000,0x5500,0x0000,0x5000,
	0x0550,0x0000,0x0550,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,0x5555,0x0000,
};

const unsigned short winMap[1024] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0001,0x0002,
	0x0003,0x0004,0x0005,0x0006,0x0000,0x0007,0x0008,0x0009,
	0x000A,0x000B,0x000C,0x000D,0x000E,0x0007,0x0007,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x000F,0x0010,
	0x0011,0x0012,0x0013,0x0014,0x0000,0x0015,0x0016,0x0017,
	0x0018,0x0019,0x0014,0x001A,0x001B,0x0015,0x001C,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x001D,0x001E,
	0x001F,0x0020,0x0021,0x0022,0x0023,0x0024,0x0000,0x0025,
	0x0026,0x0027,0x0014,0x0014,0x0028,0x0015,0x0029,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

const unsigned short winPal[256] __attribute__((aligned(4)))=
{
	0x0000,0x0055,0x4A52,0x4800,0x2256,0x02C0,0x18C6,0x739C,
	0x019D,0x2148,0x037B,0x6DBF,0x001F,0x6D20,0x02DF,0x258C,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

//}}BLOCK(win)
