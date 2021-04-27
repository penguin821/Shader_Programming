#version 450

in vec3 a_Position; // float ������ 3��
in vec3 a_Vel; // float �ӵ� 3��
in float a_EmitTime; // float ��ƼŬ ���� �ð� 1��

uniform float u_Time; // ���� �ð�

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
	
	gl_Position = vec4(newpos, 1); // OpenGL ���� ��°�
}
