/// @description EM_INIT AND EM_ADD_SECTION
em_init(
    3,
    fCyber,
    32,
    ">",
    room_width/2,
    room_height/2,
    fa_center,
    fa_top,
    c_white,
    "Time Themed Rogue-like",
    100,
    0,
    0,
    2,
    2,
    sfxArrowWallHit,
);

em_add_section("Tutorial",startTutorial);
em_add_section("Play",startGame);
em_add_section("Exit",endGame);

