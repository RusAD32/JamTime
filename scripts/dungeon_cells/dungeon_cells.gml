legend = ds_map_create();

legend[? "P"] = obj_player;
legend[? "#"] = obj_dungeon_wall;
legend[? "c"] = obj_dungeon_cat_monster;
legend[? "p"] = obj_dungeon_potato_monster;
legend[? "A"] = obj_dungeon_altar;
legend[? "L"] = obj_dungeon_light;
legend[? "T"] = obj_dungeon_hanger;
legend[? "E"] = obj_dungeon_exit;
legend[? "R"] =obj_repeat;

cell_size = 16;
tile_size = 32;
dungeon_width = 6;
dungeon_height = 6;

// Cell type start -----------
j = 0;

// ---
i = 0;
cell_start[j, i++] = "################"
cell_start[j, i++] = "#             ##"
cell_start[j, i++] = "#   ###    R   #"
cell_start[j, i++] = "#  ##  #       #"
cell_start[j, i++] = "#  # # #      ##"
cell_start[j, i++] = "#  #  ##      ##"
cell_start[j, i++] = "#   ### P     ##"
cell_start[j, i++] = "#             ##"
cell_start[j, i++] = "#             ##"
cell_start[j, i++] = "#             ##"
cell_start[j, i++] = "##            ##"
cell_start[j, i++] = "##            ##"
cell_start[j, i++] = "##             #"
cell_start[j, i++] = "##             #"
cell_start[j, i++] = "##             #"
cell_start[j, i++] = "#              #"
j++;

// Cell type finish -----------
j = 0;

// ---
i = 0;
cell_finish[j, i++] = "################"
cell_finish[j, i++] = "#              #"
cell_finish[j, i++] = "#    #         #"
cell_finish[j, i++] = "#   ####      ##"
cell_finish[j, i++] = "#  # #      E ##"
cell_finish[j, i++] = "#   ###       ##"
cell_finish[j, i++] = "#    # #      ##"
cell_finish[j, i++] = "#  ####       ##"
cell_finish[j, i++] = "#    #        ##"
cell_finish[j, i++] = "#             ##"
cell_finish[j, i++] = "##            ##"
cell_finish[j, i++] = "##            B#"
cell_finish[j, i++] = "##             #"
cell_finish[j, i++] = "##             #"
cell_finish[j, i++] = "#              #"
cell_finish[j, i++] = "#              #"
j++;


// Cell type X -----------
j = 0;

// ---
i = 0;
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
cell_X[j, i++] = "################"
j++;
// ---


// Cell type D -----------
j = 0;

// ---
i = 0;
cell_D[j, i++] = "################"
cell_D[j, i++] = "##             #"
cell_D[j, i++] = "##             #"
cell_D[j, i++] = "##             #"
cell_D[j, i++] = "##             #"
cell_D[j, i++] = "##            ##"
cell_D[j, i++] = "##            ##"
cell_D[j, i++] = "#            B##"
cell_D[j, i++] = "#             ##"
cell_D[j, i++] = "#             ##"
cell_D[j, i++] = "#              #"
cell_D[j, i++] = "##             #"
cell_D[j, i++] = "##             #"
cell_D[j, i++] = "##             #"
cell_D[j, i++] = "#              #"
cell_D[j, i++] = "#              #"
j++;

// Cell type RD -----------
j = 0;

// ---
i = 0;
cell_RD[j, i++] = "################"
cell_RD[j, i++] = "########T       "
cell_RD[j, i++] = "#               "
cell_RD[j, i++] = "#               "
cell_RD[j, i++] = "#               "
cell_RD[j, i++] = "#               "
cell_RD[j, i++] = "##              "
cell_RD[j, i++] = "##              "
cell_RD[j, i++] = "#               "
cell_RD[j, i++] = "#               "
cell_RD[j, i++] = "#               "
cell_RD[j, i++] = "##              "
cell_RD[j, i++] = "##              "
cell_RD[j, i++] = "##              "
cell_RD[j, i++] = "#               "
cell_RD[j, i++] = "#              #"
j++;

// Cell type UD -----------
j = 0;

// ---
i = 0;
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#             ##"
cell_UD[j, i++] = "#             ##"
cell_UD[j, i++] = "##             #"
cell_UD[j, i++] = "##             #"
cell_UD[j, i++] = "##            ##"
cell_UD[j, i++] = "#T            ##"
cell_UD[j, i++] = "#             ##"
cell_UD[j, i++] = "#             ##"
cell_UD[j, i++] = "##            ##"
cell_UD[j, i++] = "##            ##"
cell_UD[j, i++] = "##             #"
cell_UD[j, i++] = "##             #"
cell_UD[j, i++] = "##             #"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#              #"
j++;


// ---
i = 0;
cell_UD[j, i++] = "#A            A#"
cell_UD[j, i++] = "##             #"
cell_UD[j, i++] = "##           ###"
cell_UD[j, i++] = "##           ###"
cell_UD[j, i++] = "#             ##"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#A            A#"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "##            ##"
cell_UD[j, i++] = "##            ##"
cell_UD[j, i++] = "##            ##"
cell_UD[j, i++] = "##             #"
cell_UD[j, i++] = "#A            A#"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#              #"
j++;

// ---
i = 0;
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#L            L#"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#             ##"
cell_UD[j, i++] = "##            ##"
cell_UD[j, i++] = "###           ##"
cell_UD[j, i++] = "###           ##"
cell_UD[j, i++] = "###            #"
cell_UD[j, i++] = "##             #"
cell_UD[j, i++] = "#L            L#"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#              #"
cell_UD[j, i++] = "#              #"
j++;


// Cell type RDL -----------
j = 0;

// ---
i = 0;
cell_RDL[j, i++] = "################"
cell_RDL[j, i++] = "    ########B   "
cell_RDL[j, i++] = "       c        "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "     c   c      "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "T               "
cell_RDL[j, i++] = "#              #"
j++;


// ---
i = 0;
cell_RDL[j, i++] = "################"
cell_RDL[j, i++] = "# AL###ALB  AL #"
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "     p          "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "# AL        LA #"
cell_RDL[j, i++] = "##            ##"
j++;

// ---
i = 0;
cell_RDL[j, i++] = "################"
cell_RDL[j, i++] = "# L A     A TL##"
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "            p   "
cell_RDL[j, i++] = "                "
cell_RDL[j, i++] = "  c             "
cell_RDL[j, i++] = "#              #"
cell_RDL[j, i++] = "##            ##"
j++;


// Cell type URDL -----------
j = 0;

// ---
i = 0;
cell_URDL[j, i++] = "##            ##"
cell_URDL[j, i++] = "#              #"
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "      #####     "
cell_URDL[j, i++] = "        #####   "
cell_URDL[j, i++] = "        ###     "
cell_URDL[j, i++] = "       ##       "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "#              #"
cell_URDL[j, i++] = "##            ##"
j++;


// ---
i = 0;
cell_URDL[j, i++] = "#              #"
cell_URDL[j, i++] = "  AL        AL  "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "       ##       "
cell_URDL[j, i++] = "      ####      "
cell_URDL[j, i++] = "      ####      "
cell_URDL[j, i++] = "       ##       "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "  AL        LA  "
cell_URDL[j, i++] = "#              #"
j++;

// ---
i = 0;
cell_URDL[j, i++] = "#              #"
cell_URDL[j, i++] = "  Lc A    A pL  "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "        #       "
cell_URDL[j, i++] = "       ##       "
cell_URDL[j, i++] = "      ####      "
cell_URDL[j, i++] = "     ######     "
cell_URDL[j, i++] = "      ####      "
cell_URDL[j, i++] = "       ##       "
cell_URDL[j, i++] = "       #        "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "  p         p   "
cell_URDL[j, i++] = "             c  "
cell_URDL[j, i++] = " TALA#    #ALAB "
cell_URDL[j, i++] = "######    ######"
j++;


// ---
i = 0;
cell_URDL[j, i++] = "##            ##"
cell_URDL[j, i++] = "#              #"
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "     #          "
cell_URDL[j, i++] = "    ##     #    "
cell_URDL[j, i++] = "   ###     ##   "
cell_URDL[j, i++] = "   ##     ###   "
cell_URDL[j, i++] = "    #     ##    "
cell_URDL[j, i++] = "          #     "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "                "
cell_URDL[j, i++] = "#              #"
cell_URDL[j, i++] = "##            ##"
j++;

