event_inherited();

/*generate substring for loading resources and more*/ {
	main_substring = global.main_substring
}

/*model*/ {
	//mesh = new BBMOD_Model(main_substring+"st.bbmod");
	mesh = resource_manager_obj.resourceManager.load(
		main_substring+"st.bbmod",
		undefined,
		method(self, function (_err, _model) {
			if (!_err)
			{
				show_debug_message("LOADED")
				_model.freeze();
			} else
				show_debug_message("NOT LOADED")
				
	}));
	mesh.freeze()
	directionBody = direction;
	size=12;
}

/*animation preconfig*/ {
    animation_player = new BBMOD_AnimationPlayer(mesh);
    animation_state = new BBMOD_AnimationStateMachine(animation_player);
}

/*animation config*/ {
    //for stand:
		st_anim = resource_manager_obj.resourceManager.load(main_substring+"st_Layer0.bbanim");
        st_state = new BBMOD_AnimationState("st", st_anim, true);
        animation_state.add_state(st_state);
    //for run:
		wl_anim = resource_manager_obj.resourceManager.load(main_substring+"wl_Layer0.bbanim");
        wl_state = new BBMOD_AnimationState("wl", wl_anim, true);
        animation_state.add_state(wl_state);
    //for attack:
		at_anim = resource_manager_obj.resourceManager.load(main_substring+"at_Layer0.bbanim");
        at_state = new BBMOD_AnimationState("at", at_anim, true);
        animation_state.add_state(at_state);
    //for death:
		dt_anim = resource_manager_obj.resourceManager.load(main_substring+"dt_Layer0.bbanim");
        dt_state = new BBMOD_AnimationState("dt", dt_anim, true);
        animation_state.add_state(dt_state);
}

/*load textures*/ {
	mat_count = global.mat_count;
	show_debug_message("mat_count: "+string(mat_count))
	for(i = 0; i < mat_count; i++) {
		if(file_exists(main_substring+"mat00"+string(i)+"_base.png"))
			base[i] = sprite_add(main_substring+"mat00"+string(i)+"_base.png", 0,0,0,0,0)
		if(file_exists(main_substring+"mat00"+string(i)+"_normal.png"))
			normal[i] = sprite_add(main_substring+"mat00"+string(i)+"_normal.png", 0,0,0,0,0)
		if(file_exists(main_substring+"mat00"+string(i)+"_specular.png"))
			specular[i] = sprite_add(main_substring+"mat00"+string(i)+"_specular.png", 0,0,0,0,0)
	}
}

/*material*/ {
	for(i = 0; i < mat_count; i++) {	
		dissolve = 0;
		hurt = 0;
		material = []
		material[i] = MatBoss().clone()
			.set_shader(BBMOD_ERenderPass.Shadows, BBMOD_SHADER_DEPTH_ANIMATED);
		if(file_exists(main_substring+"mat00"+string(i)+"_base.png"))
			material[i].BaseOpacity = sprite_get_texture(base[i], 0);
		if(file_exists(main_substring+"mat00"+string(i)+"_normal.png"))
			material[i].NormalSmoothness = sprite_get_texture(normal[i], 0);
		if(file_exists(main_substring+"mat00"+string(i)+"_specular.png"))
			material[i].SpecularColor = sprite_get_texture(specular[i], 0);
		material[i].OnApply = method(self, function (_material) {
				var _shader = BBMOD_SHADER_CURRENT;
				var _dissolveColor = _shader.get_uniform("u_vDissolveColor");
				var _dissolveThreshold = _shader.get_uniform("u_fDissolveThreshold");
				var _dissolveRange = _shader.get_uniform("u_fDissolveRange");
				var _dissolveScale = _shader.get_uniform("u_vDissolveScale");
				var _silhouette = _shader.get_uniform("u_vSilhouette");
				_shader.set_uniform_f3(_dissolveColor, global.d_red, global.d_green, global.d_blue);
				_shader.set_uniform_f(_dissolveThreshold, dissolve);
				_shader.set_uniform_f(_dissolveRange, 0.3);
				_shader.set_uniform_f2(_dissolveScale, 20.0, 20.0);
				_shader.set_uniform_f4(_silhouette, 1.0, 1.0, 1.0, hurt);
		});
		material[i].Culling = cull_noculling
	}
}

/*generate model*/ {
    animation_state.start();
    matrixBody = matrix_build_identity();
}

/*events*/ {
	animation_state.change_state(st_state);
	currentSpeed = 0;
	kadr_at_krit=global.kadr_at_krit;
	st=global.st
	at=global.at
	wl=global.wl;
	dt=m_object_dt;
	kadrs_st=global.kadrs_st;
	kadrs_at=global.kadrs_at;
	kadrs_dt=global.kadrs_dt;
	xw=global.xw;
	xh=global.xh;
	first_attack = 1;
	alpha=0.05;
	kadr=0;
	koeff=1;
	alive=1;
	attack_trig_slash=1;
	global.e_koeff = 2;
	frozen = false;
	loaded = 1;
	reg_rad = global.reg_rad
	state_kd = 0;
	timer_kd = 0;
	e_kd_mili = global.e_kd*60
}
