/* inserting a room with a key */

var my_walk;
var key_room, lock_room;

key_room[0] = c_t.keyU;
key_room[1] = c_t.keyR;
key_room[2] = c_t.key;       
key_room[3] = c_t.keyL;

my_walk[0] = walk[3];
my_walk[1] = walk[2];
my_walk[2] = walk[1];
my_walk[3] = walk[0];

insert_room_into_dungeon(key_room, my_walk);

