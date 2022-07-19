if(enabled) {
	event_inherited();
	directionBody += angle_difference(direction, directionBody) * 1 * 0.2;
	direction+=koeff;
	if (z_up_mode == 0)
		z+=0.02

	if (z>=7)
		z_up_mode = 1;
	
	if (z_up_mode == 1)
		z-=0.02

	if (z<=5)
		z_up_mode = 0;
}

if(state == 0) {
	if(size_f>size) size+=abs(size_f-size)/koeff_grow;
	if(size_aura_f>size_aura) size_aura+=abs(size_aura_f-size_aura)/koeff_grow;
	koeff = size_f/size;
	if(size_f==size)
		state = 1
} else
if(state == 2) {
	
	if(0<size) size-=abs(0-size)/koeff_grow;
	if(0<size_aura) size_aura-=abs(0-size_aura)/koeff_grow;
	koeff = size/size_f;
	if(0==size)
		instance_destroy(self)
	
}


















































