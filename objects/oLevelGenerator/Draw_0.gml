//This draw script shpuld be used to debug ONLY
//drawing this many colored rectangles is slow, and you may want to use sprites
//generator_debug_draw()


draw_set_color(c_white)
draw_set_halign(fa_left)
draw_text(8,8,string_hash_to_newline("This level took "+string(end_time)+"ms to generate"))
draw_text(8,32,string_hash_to_newline("-Press space to generate another level-"))
draw_set_color(c_white)

