#version 450

in vec3 a_Position; // float ������ 3��
in vec3 a_Vel; // float �ӵ� 3��
in float a_EmitTime; // float ��ƼŬ ���� �ð� 1��
in float a_LifeTime; // float ���� �ð� 1��
in float a_Period; // float �ֱ� 1��
in float a_Amp; // float �� 1��
in float a_Value; // float value 1��

uniform float u_Time; // ���� �ð�
uniform vec3 u_Exforce; // �ܺ� �Է�

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
	
	gl_Position = vec4(newpos, 1); // OpenGL ���� ��°�
}
