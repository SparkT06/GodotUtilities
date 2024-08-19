shader_type canvas_item;

void fragment() {
	vec4 color = texture(TEXTURE, UV + vec2(0.04*TIME , 0.02*TIME));
	COLOR.rgba =  color.rgba;
	}
