var start_room, my_walk;

start_room[0] = c_t.startU;
start_room[1] = c_t.startR;
start_room[2] = c_t.start;       
start_room[3] = c_t.startL;

my_walk[0] = walk[0];
my_walk[1] = walk[1];
my_walk[2] = walk[2];
my_walk[3] = walk[3];

insert_room_into_dungeon(start_room, my_walk);
