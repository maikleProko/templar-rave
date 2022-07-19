
/*update model*/ {
	directionBody += angle_difference(direction, directionBody) * 1 * 0.2;
	animation_state.update(delta_time)
}

/*update animation*/ {
	if(current_animation == 0) {
		state_attack = 0
		if(!changed_animation) {
			animation_state.change_state(st_state);
			changed_animation = 1
		}
	}
	else if(current_animation == 1) {
		state_attack = 0
		direction = controller_back_obj.direction
		if(!changed_animation) {
			animation_state.change_state(wl_state);
			changed_animation = 1
		}
	}
	else if(current_animation == 2) {
		state_attack = 1
		if(!changed_animation) {
			animation_state.change_state(at1_state);
			changed_animation = 1
		}
		if (x-reg_rad>boss_class.x || x+reg_rad<boss_class.x || y-reg_rad>boss_class.y || y+reg_rad<boss_class.y) {
			current_animation = 0;
			changed_animation = 0;
		} 
	}
	else if(current_animation == 3) {
		state_attack = 1
		if(!changed_animation) {
			animation_state.change_state(at2_state);
			changed_animation = 1
		}
		if (x-reg_rad>boss_class.x || x+reg_rad<boss_class.x || y-reg_rad>boss_class.y || y+reg_rad<boss_class.y) {
			current_animation = 0;
			changed_animation = 0;
		} 
	}
	else if(current_animation == 4) {
		state_attack = 1
		if(!changed_animation) {
			animation_state.change_state(dt_state);
			changed_animation = 1
		}
	}
}
	
/*custom update*/ {
	//if(speed>0)
		//speed = (global.gameSpeed)*global.h_speed
}



