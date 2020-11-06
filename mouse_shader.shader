shader_type canvas_item;

void fragment(){
	vec2 uv = UV;
	
	COLOR = texture(TEXTURE,UV);
	if(COLOR == vec4(1f,0f,1f,1f)){
		COLOR.a = 0f;
	}
	
}