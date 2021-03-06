shader_type canvas_item;

//Glitch Controls
const float sin1_size_scale = 0.1f;
const float sin2_size_scale = 0.1f;
const float sin2_power_scale = 0.15f;
const float sin_thresh = 0.9992f;
const float glitch_scale = 15f;
const float time_scale = 800.0f;
const float wave_scale = 250f;

const float size_x = 0.0008;
const float size_y = 0.0008;

void fragment(){
	//------------------
	// Glitch
	//------------------
	float sine = sin(((FRAGCOORD.x / sin1_size_scale) + (TIME * time_scale)) * SCREEN_PIXEL_SIZE.x);
	if(sine > sin_thresh) sine = sine;
	else sine = 0f;
	sine += sin(((FRAGCOORD.x / sin2_size_scale) + (TIME * time_scale)) * SCREEN_PIXEL_SIZE.x) * sin2_power_scale;
	
	vec2 uv = SCREEN_UV;
	uv.y += (sine/wave_scale);
	
	float nsize_x = size_x * sine * glitch_scale;
	float nsize_y = size_y * sine * glitch_scale;
	uv -= mod(uv, vec2(nsize_x, size_y));
	
	vec3 pixel = textureLod(SCREEN_TEXTURE, uv, 0.0).rgb;
	pixel.g = pixel.g + ((sine/5.0f)-0.2f) + 0.2;
	
	COLOR.rgb = pixel;
	
}