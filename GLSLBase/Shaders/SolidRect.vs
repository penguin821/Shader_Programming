#version 450

// in vec3 a_Position; // ����ڰ� ������ �Է� ��
// layout (location = 0) in vec3 a_Position; // float 3��
// layout (location = 1) in vec3 a_Position1; // float 3��, �� 6��

uniform float u_Scale;

in vec3 a_Position; 
in vec3 a_Position1;

void main()
{
	gl_Position = vec4(a_Position*u_Scale, 1); // OpenGL ���� ��°�
}
