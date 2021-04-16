#version 450

// in vec3 a_Position; // 사용자가 정의한 입력 값
// layout (location = 0) in vec3 a_Position; // float 3개
// layout (location = 1) in vec3 a_Position1; // float 3개, 총 6개

uniform float u_Scale;

in vec3 a_Position; 
in vec3 a_Position1;

void main()
{
	gl_Position = vec4(a_Position*u_Scale, 1); // OpenGL 고유 출력값
}
