#version 450

in vec3 a_Position; // float 포지션 3개
in vec3 a_Vel; // float 속도 3개
in float a_EmitTime; // float 파티클 시작 시간 1개

uniform float u_Time; // 누적 시간

const vec3 c_Gravity = vec3(0, -2.8, 0);

void main()
{
	float newTime = u_Time - a_EmitTime;

	vec3 newpos = a_Position;

	if (newTime < 0.0)
	{
		newpos = vec3(1000, 1000, 1000);
	}
	else
	{
		float t = newTime;
		float tt = t * t;
		newpos = newpos + t * a_Vel + 0.5 * c_Gravity * tt;
	}
	
	gl_Position = vec4(newpos, 1); // OpenGL 고유 출력값
}
