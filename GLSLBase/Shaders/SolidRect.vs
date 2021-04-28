#version 450

in vec3 a_Position; // float 포지션 3개
in vec3 a_Vel; // float 속도 3개
in float a_EmitTime; // float 파티클 시작 시간 1개
in float a_LifeTime; // float 생명 시간 1개
in float a_Period; // float 주기 1개
in float a_Amp; // float 폭 1개
in float a_Value; // float value 1개

uniform float u_Time; // 누적 시간
uniform vec3 u_Exforce; // 외부 입력

const vec3 c_Gravity = vec3(0, -2.8, 0);
const mat3 c_NV = mat3(0, -1, 0, 1, 0, 0, 0, 0, 0);

void main()
{
	float newTime = u_Time - a_EmitTime;
	
	//vec3 newpos = a_Position;
	vec3 newpos;
	newpos.x = a_Position.x + cos(a_Value * 2 * 3.14);
	newpos.y = a_Position.y + sin(a_Value * 2 * 3.14);

	if (newTime < 0.0)
	{
		newpos = vec3(1000, 1000, 1000);
	}
	else
	{
		/*newTime = mod(newTime, a_LifeTime);
		newpos = newpos + vec3(newTime, 0, 0);
		newpos.y = newpos.y + (a_Amp * newTime) * sin(newTime * 3.14 * 2 * a_Period);*/
		
		newTime = mod(newTime, a_LifeTime);
		float t = newTime;
		float tt = t * t;
		vec3 newAcc = c_Gravity + u_Exforce;
		vec3 currVel = a_Vel + t * newAcc;
		vec3 normalV = normalize(currVel * c_NV);
		newpos = newpos + t * a_Vel + 0.5 * newAcc * tt;
		newpos = newpos + normalV * a_Amp * sin(newTime * 3.14 * 2 * a_Period);
	}
	
	gl_Position = vec4(newpos, 1); // OpenGL 고유 출력값
}
