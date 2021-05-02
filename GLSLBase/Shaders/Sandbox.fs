#version 450

layout(location=0) out vec4 FragColor; // 사용자 정의 입력 값

varying vec4 v_Color;

const vec3 Circle = vec3(0.5, 0.5, 0.0);
const float PI = 3.141592;

vec4 CenterCircle()
{
	float d = length(v_Color.rgb - Circle);
	float count = 1;
	float rad = d * 2.0 * 2.0 * PI * count;
	float gray = sin(rad);
	float width = 30;
	gray = pow(gray, width);
	return vec4(gray);
}

void main()
{
	vec4 color = vec4(0);

	float tempLength = length(v_Color.rgb - Circle);
	if (tempLength < 0.5 && tempLength > 0.4)
	{
		color = vec4(1,1,1,1);
	}
	else
	{
		color = vec4(0,0,0,0);
	}
	FragColor = CenterCircle();
}
