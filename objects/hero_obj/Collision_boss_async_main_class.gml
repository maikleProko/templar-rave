
if(kadr>58) {
	while(kadr>58) kadr-=58;
	rand1=irandom_range(0,1);
	attack_trig=1;
	attack_trig_slash=1;
	if(rand1==0) { 
		speed = 0;
		if(instance_number(boss_async_main_class))
			direction=point_direction(x,y,boss_async_main_class.x,boss_async_main_class.y)
		current_animation=2;
		changed_animation=0;
	}
	else if(rand1==1) { 
		speed = 0;
		if(instance_number(boss_async_main_class))
			direction=point_direction(x,y,boss_async_main_class.x,boss_async_main_class.y)
		current_animation=3;
		changed_animation=0;
	}
}
if(current_animation==2 || current_animation==3) {
if(kadr>39)&&(kadr<58)&&(attack_trig==1)
{
damage=irandom_range(global.h_attack/(2/3), global.h_attack);
damage=round(damage-damage*(global.e_armor * 0.06) / (1 + global.e_armor * 0.06))
global.e_hp-=damage;
global.h_money+=round(irandom_range(global.h_attack/20,global.h_attack/19)*global.e_mnog);
attack_trig=0;
}


if kadr>27 && attack_trig_slash==1
{

attack_trig_slash=0;

rand2=irandom_range(1,3)
if rand2==1 audio_play_sound(hero_at1_snd, 100,0);
if rand2==2 audio_play_sound(hero_at2_snd, 100,0);
if rand2==3 audio_play_sound(hero_at3_snd, 100,0);

if(instance_number(boss_main_class)) instance_create(global.xw,
                                                     global.xh, breaking_obj);
}
}
