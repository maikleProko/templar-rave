
/*update model*/ {
	directionBody += angle_difference(direction, directionBody) * 1 * 0.2;
	animation_state.update(delta_time)
}
			
/*update animation*/ {
	if(sprite_index == st) {
		state_attack = 0
		if(animation_state != st_state)
			animation_state.change_state(st_state);
	}
	if(sprite_index == wl) {
		state_attack = 0
		if(animation_state != wl_state)
			animation_state.change_state(wl_state);
	}
	if(sprite_index == at) {
		state_attack = 1
		if(animation_state != at_state)
			animation_state.change_state(at_state);
	}	
	if(sprite_index == dt) {
		state_attack = 0
		if(animation_state != dt_state)
			animation_state.change_state(dt_state);
	}
}

/*custom update*/ {
	direction=point_direction(x,y,hero_obj.x,hero_obj.y)
}




