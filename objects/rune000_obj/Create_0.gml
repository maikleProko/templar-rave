main_substring = string_delete(object_get_name(object_index), string_length(object_get_name(object_index))-2, 4)

/*model:*/ {
	mesh_sword = new BBMOD_Model(main_substring+"sword.bbmod");
	mesh_aura = new BBMOD_Model(main_substring+"aura_mesh.bbmod");
}

/*load textures*/ {
	base = sprite_add(main_substring+"base.png",
		0,0,0,0,0)
	base_aura = sprite_add(main_substring+"aura_base.png",
		0,0,0,0,0)
}

/*material:*/ {
	dissolve = 0;
	hurt = 0;
	material = BBMOD_MATERIAL_PBR.clone()
	material.AlphaTest = 0
	material.BlendMode = bm_src_alpha
	material.BaseOpacity = sprite_get_texture(base, 0);
	material.Emissive = sprite_get_texture(base, 0);
	mesh_sword.Materials[@ 0] = material;
	
	material_aura = BBMOD_MATERIAL_PBR.clone()
	material_aura.AlphaBlend = true
	material_aura.AlphaTest = 0.1
	material_aura.BlendMode = bm_src_alpha
	material_aura.BaseOpacity = sprite_get_texture(base_aura, 0);
	material_aura.Emissive = sprite_get_texture(base_aura, 0);
	mesh_aura.Materials[@ 0] = material_aura;
}

/*generate model*/ {
	mesh_sword.freeze();
	mesh_aura.freeze();
}

/*events*/ {
	directionBody = direction;
	size_f = 0.25;
	size_aura_f = 1.5;
	size = 0;
	size_aura = 0;
	enabled = 1;
	z = 5;
	z_up_mode = 0;
	state = 0;
	koeff = 1;
	koeff_grow = 10;
	text = ""
    matrixBody = matrix_build_identity();
}


















































