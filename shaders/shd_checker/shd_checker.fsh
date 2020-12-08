//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec3 _white=vec3(
	255,255,255
);

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec3 test = vec3(
	    gl_FragColor.r * 255.0,
	    gl_FragColor.g * 255.0, 
	    gl_FragColor.b * 255.0
	);
	
	gl_FragColor = vec4(
	    test.r / 255.0,
	    test.g / 255.0,
	    test.b / 255.0,
	    0.0
	);
}
