/*setupLightSky*/{
	z = 0;
	w_range = 100;
    sunLight = new BBMOD_DirectionalLight();
    sunLight.CastShadows = true;
    bbmod_light_directional_set(sunLight);
	bbmod_light_ambient_set_up(new BBMOD_Color().FromHex($171e2a));
	bbmod_light_ambient_set_down(new BBMOD_Color().FromHex($647180));
	sunLight.Color = BBMOD_C_WHITE;
	sunLight.Direction.Set(1, -1, -1);
}













































