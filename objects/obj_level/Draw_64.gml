// Draw Center lines
draw_set_color(c_red);
draw_set_alpha(0.5);
draw_line_width(360, 0, 360, 720, 2);
draw_line_width(0, 360, 720, 360, 2);
draw_set_alpha(1);



// Set up the text
draw_set_color(c_lime);
draw_set_halign(fa_center);
draw_set_font(fnt_dungeonname);



// Draw Text
draw_set_halign(fa_center)
draw_text(360,50,string_hash_to_newline("Press [Space] for new dungeon"));

if (maptype = 0) {
    draw_set_halign(fa_left);
    draw_text(20,100,string_hash_to_newline("Cell Size: " + string(cellsize)));
    draw_text(20,125,string_hash_to_newline("Dungeon Size: " + string(reps)));
    draw_text(20,150,string_hash_to_newline("Carver Type: " + string(carverdisplay)));
    draw_text(20,175,string_hash_to_newline("Carver Size: " + string(carversize)));
    draw_set_halign(fa_center);
    draw_text(360,20,string_hash_to_newline("Dungeon Style: Organic"));
}
if (maptype = 1) {
    draw_set_halign(fa_left);
    draw_text(20,100,string_hash_to_newline("Cell Size: " + string(cellsize)));
    draw_text(20,125,string_hash_to_newline("Dungeon Size: " + string(reps)));
    draw_text(20,150,string_hash_to_newline("Direction Change Frequency: " + string(dirfrequency)));
    draw_text(20,175,string_hash_to_newline("Room Size Average: " + string(roomsizeaverage)));
    draw_text(20,200,string_hash_to_newline("Room Frequency: " + string(roomfrequency)));
    draw_set_halign(fa_center);
    draw_text(360,20,string_hash_to_newline("Dungeon Style: Long Hallway"));
}
if (maptype = 2) {
    draw_set_halign(fa_left);
    draw_text(20,100,string_hash_to_newline("Cell Size: " + string(cellsize)));
    draw_text(20,125,string_hash_to_newline("Rooms: " + string(rooms)));
    draw_text(20,150,string_hash_to_newline("Room Size: " + string(roomsizeaverage)));
    draw_text(20,175,string_hash_to_newline("Hallway Size: " + string(hallwaysize)));
    draw_text(20,200,string_hash_to_newline("Padding: " + string(padding))); 
    draw_set_halign(fa_center);
    draw_text(360,20,string_hash_to_newline("Dungeon Style: Grid"));   
}
if (maptype = 3) {
    draw_set_halign(fa_left);
    draw_text(20,100,string_hash_to_newline("Cell Size: " + string(cellsize)));
    draw_text(20,125,string_hash_to_newline("Rooms: " + string(rooms)));
    draw_text(20,150,string_hash_to_newline("Hallway Size: " + string(hallwaysize)));
    draw_set_halign(fa_center);
    draw_text(360,20,string_hash_to_newline("Dungeon Style: Rooms n' Corridors"));   
}
if (maptype = 4) {
    draw_set_halign(fa_center);
    draw_text(360,20,string_hash_to_newline("Dungeon Style: Previously created and loaded dungeon"));   
}

draw_set_halign(fa_center)
draw_text(360,600,string_hash_to_newline("Warning: When the dungeon hits the end of the grid#it gets mashed up against the edge and can#throw offthe way the grid dungeon# is created."));

