/// @description Insert description here
// You can write your code in this editor

var chance = 0.5 + 0.5 * 1/sqrt(oLevelGenerator.level_number);

if random(1) < chance {
	instance_create_depth(x, y, -y, oBonusTime);	
}