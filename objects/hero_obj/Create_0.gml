/*generate substring for loading resources and more*/ {
	main_substring = string_delete(object_get_name(object_index), string_length(object_get_name(object_index))-2, 4)
}

/*model*/ {
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
	//mesh = new BBMOD_Model(main_substring+"st.bbmod");
	directionBody = direction;
	size=5;
}

/*animation preconfig*/ {
    animation_player = new BBMOD_AnimationPlayer(mesh);
    animation_state = new BBMOD_AnimationStateMachine(animation_player);
}

/*animation config*/ {
    //for stand:
    	st_anim = new BBMOD_Animation(main_substring+"st_Layer0.bbanim")
        st_state = new BBMOD_AnimationState("st", st_anim, true);
        animation_state.add_state(st_state);
    //for run:
    	wl_anim = new BBMOD_Animation(main_substring+"wl_Layer0.bbanim")
        wl_state = new BBMOD_AnimationState("wl", wl_anim, true);
        animation_state.add_state(wl_state);
    //for attack 1:
    	at1_anim = new BBMOD_Animation(main_substring+"at1_Layer0.bbanim")
        at1_state = new BBMOD_AnimationState("at1", at1_anim, true);
        animation_state.add_state(at1_state);
    //for attack 2:
    	at2_anim = new BBMOD_Animation(main_substring+"at2_Layer0.bbanim")
        at2_state = new BBMOD_AnimationState("at2", at2_anim, true);
        animation_state.add_state(at2_state);
    //for death:
    	dt_anim = new BBMOD_Animation(main_substring+"dt_Layer0.bbanim")
        dt_state = new BBMOD_AnimationState("dt", dt_anim, false);
        animation_state.add_state(dt_state);
}

/*load textures*/ {
	base = sprite_add(main_substring+"base.png",
		0,0,0,0,0)
	normal = sprite_add(main_substring+"normal.png",
		0,0,0,0,0)
	specular = sprite_add(main_substring+"specular.png",
		0,0,0,0,0)
}

/*material*/ {
	dissolve = 0;
	hurt = 0;
	material = MatBoss().clone()
		.set_shader(BBMOD_ERenderPass.Shadows, BBMOD_SHADER_DEPTH_ANIMATED);
	material.BaseOpacity = sprite_get_texture(base, 0);
	material.NormalSmoothness = sprite_get_texture(normal, 0);
	material.SpecularColor = sprite_get_texture(specular, 0);
	material.OnApply = method(self, function (_material) {
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
	material.Culling = cull_noculling
}

/*generate model*/ {
	mesh.freeze();
    animation_state.start();
    matrixBody = matrix_build_identity();
}

/*events*/ {
	animation_state.change_state(st_state);
}

/*properties*/ {
}

/*mechanic variables*/ {
	currentSpeed = 0;
	attack_trig=1;
	attack_trig_slash=1;
	current_animation = 0;
	changed_animation = 0;
	state_attack = 1;	
	kadr=0;
	koeff=1;
	menu_select = 0;
	global.stage=1;
	global.alive=1;
	direction = -60
	frozen = false;
	_grayscale = 0;
	reg_rad = 60
	invul = false
}




