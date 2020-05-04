/*

WARNING: As of now, bg placement is INFLEXIBLE and only works for tile size 32 and dungeon cell 
size 12.

Thus each bg_tile is supposed to be 128 x 128 in size.
You can use up to 9 bg tiles in your 


*/

/*                                                                                                */
/* Size of a background cell in pixels.                                                           */
/*                                                                                                */
bg_cell_size = 3;
bg_tile_size = 4 * tile_size;

// Set the characters to use
bg_chars[0] = "//__";
bg_chars[1] = " .[]";

dg_background = bg_big_128;

/*                                                                                                */
/* For each element of the dungeon array...                                                       */
/*                                                                                                */

// Cell type start -----------
// ---
i =0;
bg_urdl[i++] =" .[] ."
bg_urdl[i++] ="[][][]"
bg_urdl[i++] =" .[] ."

// ---
i =0;
bg_rdl[i++] =" . . ."
bg_rdl[i++] ="[][][]"
bg_rdl[i++] =" .[] ."

// ---
i =0;
bg_rd[i++] =" . . ."
bg_rd[i++] =" .[][]"
bg_rd[i++] =" .[] ."
j++;

// ---
i =0;
bg_ud[i++] =" .[] ."
bg_ud[i++] =" .[] ."
bg_ud[i++] =" .[] ."

// ---
i =0;
bg_d[i++] ="[][][]"
bg_d[i++] ="[] .[]"
bg_d[i++] ="[][][]"

// ---
i =0;
bg_x[i++] ="x.x.x."
bg_x[i++] ="x.x.x."
bg_x[i++] ="x.x.x."

// Actual background extraction
dg_extract_dungeon_background();
