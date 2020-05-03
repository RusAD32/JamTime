//desc cosBetweenVectors(x1,y1,x2,y2)

if argument_count > 3 {
	x1 = argument[0];
	y1 = argument[1];
	x2 = argument[2];
	y2 = argument[3];
	//if x1 < 0 || x2 < 0 || y1 < 0 || y2 < 0 return -1;
	var scalar_prod = x1*x2 + y1*y2;
	var mod1 = sqrt(sqr(x1) + sqr(y1));
	var mod2 = sqrt(sqr(x2) + sqr(y2));

	return scalar_prod / (mod1 * mod2);
}