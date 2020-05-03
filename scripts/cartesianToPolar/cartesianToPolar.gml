show_debug_message(argument0);
show_debug_message(argument1);

var ang_x = argument0;
var ang_y = argument1;
var r = sqrt(sqr(ang_x) + sqr(ang_y));

// edge cases
if ang_x == 0 {
	return pi - sign(ang_y)*pi/2	
}

var phi = arctan(abs(ang_y/ang_x));
if ang_y > 0 && ang_x <= 0 {
	phi = pi - phi;
} else if ang_y <= 0 && ang_x <= 0 {
	phi += pi ;
} else if ang_y <= 0 && ang_x > 0{
	phi = 2*pi - phi;
}
return phi
