
//{{BLOCK(pausedbg)

//======================================================================
//
//	pausedbg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 13 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 416 + 2048 = 2976
//
//	Time-stamp: 2020-10-19, 16:01:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEDBG_H
#define GRIT_PAUSEDBG_H

#define pausedbgTilesLen 416
extern const unsigned short pausedbgTiles[208];

#define pausedbgMapLen 2048
extern const unsigned short pausedbgMap[1024];

#define pausedbgPalLen 512
extern const unsigned short pausedbgPal[256];

#endif // GRIT_PAUSEDBG_H

//}}BLOCK(pausedbg)
