/// @description Insert description here
// You can write your code in this editor
if instance_exists(oTextStatic) {
	instance_destroy(instance_nearest(x, y, oTextStatic));
}
var newText = instance_create_depth(x,y, -y-100, oTextStatic);
newText.text = "Mouse/RStick to look around"
instance_destroy(self)