//cleaning
for(i = 0; i < mat_count; i++) {
	if(file_exists(main_substring+"mat00"+string(i)+"_base.png"))
		sprite_delete(base[i])
	if(file_exists(main_substring+"mat00"+string(i)+"_normal.png"))
		sprite_delete(normal[i])
	if(file_exists(main_substring+"mat00"+string(i)+"_specular.png"))
		sprite_delete(specular[i])
	material[i].destroy()
}
mesh.free()
animation_player.destroy()
animation_state.destroy()
st_anim.destroy();
wl_anim.destroy();
at_anim.destroy();
dt_anim.destroy();
st_state.destroy();
wl_state.destroy();
at_state.destroy();
dt_state.destroy();
show_debug_message("deleted res")
