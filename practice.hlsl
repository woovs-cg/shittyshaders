#define PI 3.1415926
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
	
	vec3 final_color = vec3(1.0);
	vec3 bg_color = vec3(0.0);
	vec3 wave_color = vec3(0.0);
    int count = 6;
	
	float wave_width = 0.01;
	uv  = -1.0 + 2.0 * uv;
	uv.y += 0.1;
	
    for (int i=0; i < count; i++) {
	uv.y += (.2 * sin(uv.x + iTime*float(i)));
	wave_width = abs(.5 / (200.0 * uv.y));
	wave_color += vec3(wave_width * 3.1*sin(iTime), wave_width, wave_width * 1.5*sin(iTime));
    }
	final_color = bg_color + wave_color;
	
	
	fragColor = vec4(final_color, 1.0);
}